//
//  ContentView.swift
//  Consultant
//
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Text("Consultant")
                .font(
                        .system(size: 34)
                        .weight(.heavy)

                    )
            Image("jobs-abstract")
                .resizable()
                .scaledToFit()
            Button("Log in") {
                //takes us to the next view
            }
            .buttonStyle(PurpleButton())
            Button("Sign up") {
                //takes us to the next view
            }
            .buttonStyle(PurpleButton())
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
