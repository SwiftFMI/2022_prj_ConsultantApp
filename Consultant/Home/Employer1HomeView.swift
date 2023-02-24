//
//  ConsultantHomeView.swift
//  Consultant
//
//

import Foundation
import SwiftUI

struct EmployerHomeView: View {
    
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
            }
            
            // Employers's ads
            UsersAdsView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")

            }
            CreateAdView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Advertise")
            }
        }
    }
    
}

struct UsersAdsView: View {
    
    var body: some View {
        Text("My Ads view")
    }
    
}

struct CreateAdView: View {
    
    var body: some View {
        Text("Create Ad view")
    }
    
}

struct EmployerHomeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployerHomeView()
    }
}
