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
    
    var body: some View {
            VStack{
                Text("Sign in")
                    .font(
                        .system(size: 34)
                        .weight(.heavy)
                    )
                Group{
                    ExtractedCredentialsView(model: $username, isUsername: true)
                    ExtractedCredentialsView(model: $password, isUsername: false)
                }
                Button("Sign in your profile"){
                    signIn()
                }
                .buttonStyle(BlueButton())
                
                    NavigationLink(destination: HomeView(), isActive: $successfulSignIn){
                        EmptyView()
                    }
            }

    }
    
    func signIn() {
        Auth.auth().signIn(withEmail: username, password: password) { (result,error) in
            if error != nil {
                print(error?.localizedDescription ?? "")
                //show Alert for unsuccessful sign in
            } else {
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
