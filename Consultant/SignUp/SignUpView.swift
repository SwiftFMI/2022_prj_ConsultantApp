//
//  SignUpView.swift
//  Consultant
//
//  Created by Delyana Raykova on 11.02.23.
//

import SwiftUI
import Firebase

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var isConsultant: Bool = false
    @State private var isEmployer: Bool = false
    @State private var userIsSignedIn = false
    
    var body: some View {
        VStack{
            Text("Sign up")
                .font(
                    .system(size: 34)
                    .weight(.heavy)
                )
            Group {
                ExtractedCredentialsView(model: $username, isUsername: true)
                ExtractedCredentialsView(model: $password, isUsername: false)
                ExtractedNamesView(model: $firstName, isFirstName: true)
                ExtractedNamesView(model: $lastName, isFirstName: false)
            }
            Toggle("Consultant", isOn: $isConsultant)
                .toggleStyle(CheckboxToggleStyle())
                .padding()
            Toggle("Employer", isOn: $isEmployer)
                .toggleStyle(CheckboxToggleStyle())
                .padding()
            Button("Create your profile") {
                signUp()
            }
            .buttonStyle(PurpleButton())
            
            NavigationLink(destination: HomeView(), isActive: $userIsSignedIn){
                EmptyView()
            }
            }
    }
    
    func signUp() {
        Auth.auth().createUser(withEmail: username, password: password) { (result,error) in
            if error != nil { //password must be at least six characters
                print(error?.localizedDescription ?? "")
            } else {
                print("success")
                userIsSignedIn = true
            }
        }
        //add to database as employer and/or consultant
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
    var body: some View {
        HStack {
            if isUsername {
                Text("Username:")
                TextField("", text: $model, prompt: Text("*required"))
                    .autocorrectionDisabled(true)
            } else {
                Text("Password:")
                SecureField("", text: $model, prompt: Text("*required"))
                    .autocorrectionDisabled(true)
            }
        }
        .padding()
    }
}

struct ExtractedNamesView: View {
    @Binding var model: String
    let isFirstName: Bool
    var body: some View {
        HStack {
            if isFirstName {
                Text("First name:")
                TextField("", text: $model, prompt: Text("*required"))
                    .autocorrectionDisabled(true)
            } else {
                Text("Last name:")
                TextField("", text: $model, prompt: Text("*required"))
                    .autocorrectionDisabled(true)
            }
        }
        .padding()
    }

}
