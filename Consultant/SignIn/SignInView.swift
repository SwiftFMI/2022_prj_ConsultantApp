//
//  SignInView.swift
//  Consultant
//
//  Created by Delyana Raykova on 11.02.23.
//

import SwiftUI
import Firebase

struct SignInView: View {
    @State private var username = ""
    @State private var password = ""
    @State private var successfulSignIn = false
    @State private var showErrorMsg = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        ZStack {
            VStack {
                Text("Sign In")
                    .font(
                        .system(size: 34)
                        .weight(.heavy)
                    )
                Group{
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
                    Text(errorMessage)
                        .foregroundColor(Color("red"))
                        .padding(.top, 5)
                        .opacity(showErrorMsg ? 100 : 0)
                }
                Button("Submit") {
                    signIn()
                }
                .buttonStyle(BlueButton())
                .padding(.top, 5)
                
                NavigationLink(destination: HomeView(), isActive: $successfulSignIn){
                    EmptyView()
                }
            }
        }
        
    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: username, password: password) { (result,error) in
            
            if error != nil {
                
                print(error?.localizedDescription ?? "")
                showErrorMsg = true;
                
                let err = error! as NSError
                switch err.code {
                case AuthErrorCode.invalidEmail.rawValue:
                    errorMessage = "Invalid email provided."
                case AuthErrorCode.wrongPassword.rawValue:
                    errorMessage = "Wrong credentials provided."
                case AuthErrorCode.userNotFound.rawValue:
                    errorMessage = "User not found."
                default:
                    print("unknown error: \(err.localizedDescription)")
                    errorMessage = "Failed to sign in"
                }
                return
            }
                showErrorMsg = false;
                successfulSignIn = true
                print("success")
            
        }
    }
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
