//
//  ProfileView.swift
//  Consultant
//
//

import Foundation
import SwiftUI

struct ProfileView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("Profile")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    Spacer()
                    
                    NavigationLink(destination: WelcomeView()) {
                        Text("Log Out")
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                    }
                }
                .padding([.leading, .trailing], 20)
                    
                Image("profile")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 130, height: 130)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color("sand"), lineWidth: 7))
                    .offset(y: 60)
                
                VStack(spacing: 10) {
                    Text("Jane Doe")
                        .font(.largeTitle)
                    Text("Artist")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                        .bold()
                    HStack {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.gray)
                        Text("janedoe@gmail.com")
                            .foregroundColor(.gray)
                            .underline(false)
                    }
                }
                .padding(.top, 80)
                
                Spacer()
            }
            .padding(.top, 10)
        }
        
    }
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
