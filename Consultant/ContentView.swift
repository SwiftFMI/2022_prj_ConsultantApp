//
//  ContentView.swift
//  Consultant
//
//

import SwiftUI

struct ContentView: View {
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Consultant")
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
                .buttonStyle(PurpleButton())
                NavigationLink("Sign up") {
                    SignUpView()
                }
                .buttonStyle(PurpleButton())
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
