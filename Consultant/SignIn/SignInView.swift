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
                    Text("Invalid credentials provided")
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
            } else {
                showErrorMsg = false;
                successfulSignIn = true
                print("success")
            }
        }
    }
}
struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
