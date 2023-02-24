//
//  WelcomeView.swift
//  Consultant
//
//

import SwiftUI

struct WelcomeView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                Text("CONSULTANT")
                    .font(
                        .system(size: 34)
                        .weight(.heavy)
                    )
                Image("jobs-abstract")
                    .resizable()
                    .scaledToFit()
                NavigationLink("Sign in") {
                    SignInView()
                }
                .buttonStyle(BlueButton())
                NavigationLink("Sign up") {
                    SignUpView()
                }
                .buttonStyle(BlueButton())
                .padding()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
