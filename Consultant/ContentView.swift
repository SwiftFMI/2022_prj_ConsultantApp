//
//  ContentView.swift
//  Consultant
//
//

import SwiftUI

struct ContentView: View {
    
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
