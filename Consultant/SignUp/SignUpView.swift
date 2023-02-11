//
//  SignUpView.swift
//  Consultant
//
//  Created by Delyana Raykova on 11.02.23.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var isConsultant: Bool = false
    @State private var isEmployer: Bool = false
    
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
                //check if the credentials are valid and cover requirements
            }
                .buttonStyle(PurpleButton())
                
                
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
