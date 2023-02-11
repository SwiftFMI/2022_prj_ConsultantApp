//
//  SignInView.swift
//  Consultant
//
//  Created by Delyana Raykova on 11.02.23.
//

import SwiftUI

struct SignInView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    
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
            Button("Sign in your profile") {
                //check if the credentials are valid and cover requirements
            }
                .buttonStyle(PurpleButton())
        }
    }
}

struct SignInView_Previews: PreviewProvider {
    static var previews: some View {
        SignInView()
    }
}
