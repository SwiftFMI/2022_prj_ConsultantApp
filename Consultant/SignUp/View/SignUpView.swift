//
//  SignUpView.swift
//  Consultant
//
//  Created by Delyana Raykova on 11.02.23.
//

import SwiftUI
import Foundation
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore
import FirebaseStorage
import Combine

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var isConsultant: Bool = false
    @State private var isEmployer: Bool = false
    @State private var userIsSignedIn: Bool = false
    @State private var showErrorMsg: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        VStack {
            Text("Sign Up")
                .font(
                    .system(size: 34)
                    .weight(.heavy)
                )
            Group {
                ExtractedCredentialsView(model: $username, isUsername: true)
                    .padding(.leading, 5)
                    .background(Color("light"))
                    .cornerRadius(20)
                    .frame(width: 350)
                ExtractedCredentialsView(model: $password, isUsername: false)
                    .padding(.leading, 5)
                    .background(Color("light"))
                    .cornerRadius(20)
                    .frame(width: 350)
                ExtractedNamesView(model: $firstName, isFirstName: true)
                    .padding(.leading, 5)
                    .background(Color("light"))
                    .cornerRadius(20)
                    .frame(width: 350)
                ExtractedNamesView(model: $lastName, isFirstName: false)
                    .padding(.leading, 5)
                    .background(Color("light"))
                    .cornerRadius(20)
                    .frame(width: 350)
            }
            Toggle("Consultant", isOn: $isConsultant)
                .toggleStyle(CheckboxToggleStyle())
                .fontWeight(.bold)
                .foregroundColor(Color("darkBlue"))
                .padding(.top, 10)
            Toggle("Employer", isOn: $isEmployer)
                .toggleStyle(CheckboxToggleStyle())
                .fontWeight(.bold)
                .foregroundColor(Color("darkBlue"))
            Text(errorMessage)
                .foregroundColor(Color("red"))
                .padding(.top, 5)
                .opacity(showErrorMsg ? 100 : 0)

            Button("Create profile") {
                signUp()
            }
            .buttonStyle(BlueButton())
            .padding(.top, 30)
            NavigationLink(destination: HomeView(), isActive: $userIsSignedIn){
                EmptyView()
            }
        }
    }
    
    func signUp() {
        if (username.isEmpty || password.isEmpty || firstName.isEmpty || lastName.isEmpty) {
            showErrorMsg = true;
            errorMessage = "Please, fill in the required fields."
            return
        }
        
        if (!isEmployer && !isConsultant) {
            showErrorMsg = true;
            errorMessage = "Please, choose a role."
            return
        }
        
        Auth.auth().createUser(withEmail: username, password: password) {
            (result, error) in
            
            if error != nil { //password must be at least six characters
                print(error?.localizedDescription ?? "")
                showErrorMsg = true;
                
                let err = error! as NSError
                switch err.code {
                case AuthErrorCode.invalidEmail.rawValue:
                    errorMessage = "Invalid email provided."
                case AuthErrorCode.emailAlreadyInUse.rawValue:
                    errorMessage = "A user with this email already exists."
                case AuthErrorCode.weakPassword.rawValue:
                    errorMessage = "Password must be at least 6 characters long."
                case AuthErrorCode.accountExistsWithDifferentCredential.rawValue:
                    errorMessage = "A user with this email already exists."
                default:
                    print("unknown error: \(err.localizedDescription)")
                    errorMessage = "Failed to register user."
                }
                return
            }
            
            if result == nil {
                showErrorMsg = true;
                errorMessage = "Failed to register user."
                return
            }
            
            var userDetails = SignUpDetails(firstName: self.firstName, lastName: self.lastName, username: self.username, isEmployer: self.isEmployer, isConsultant: self.isConsultant)

            showErrorMsg = false;
            errorMessage = ""
            print("success")
            userIsSignedIn = true
            
            addUserToDB(user: userDetails)
        }
    }
    
    func addUserToDB(user: SignUpDetails) {
        guard let currentUser = Auth.auth().currentUser else { return }
        var docRef = Firestore.firestore().collection("Users").document(currentUser.uid);
        
        do {
            let _ = try docRef.setData([
                "firstName": user.firstName,
                "lastName": user.lastName,
                "username": user.username,
                "isEmployer": user.isEmployer,
                "isConsultant": user.isConsultant
            ])
        }
        catch {
            print(error.localizedDescription)
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}

struct ExtractedCredentialsView: View {
    
    @Binding var model: String
    let isUsername: Bool
    let textLimit = 30
    
    var body: some View {
        HStack {
            if isUsername {
                Text("Username:")
                TextField("", text: $model, prompt: Text("*required"))
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .onReceive(Just(model)) { _ in limitText(textLimit) }
            } else {
                Text("Password:")
                SecureField("", text: $model, prompt: Text("*required"))
                    .autocorrectionDisabled(true)
                    .autocapitalization(.none)
                    .onReceive(Just(model)) { _ in limitText(textLimit) }
            }
        }
        .padding()
    }
    
    //Function to keep text length in limits
    func limitText(_ upper: Int) {
        if model.count > upper {
            model = String(model.prefix(upper))
        }
    }
}

struct ExtractedNamesView: View {
    
    @Binding var model: String
    let isFirstName: Bool
    let textLimit = 20
    
    var body: some View {
        HStack {
            if isFirstName {
                Text("First name:")
                TextField("", text: $model, prompt: Text("*required"))
                    .autocorrectionDisabled(true)
                    .onReceive(Just(model)) { _ in limitText(textLimit) }
            } else {
                Text("Last name:")
                TextField("", text: $model, prompt: Text("*required"))
                    .autocorrectionDisabled(true)
                    .onReceive(Just(model)) { _ in limitText(textLimit) }
            }
        }
        .padding()
    }
    
    //Function to keep text length in limits
    func limitText(_ upper: Int) {
        if model.count > upper {
            model = String(model.prefix(upper))
        }
    }
}
