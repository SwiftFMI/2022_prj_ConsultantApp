//
//  EmployerHomeView.swift
//  Consultant
//
//

import Foundation
import SwiftUI

struct ConsultantHomeView: View {
    
    var body: some View {
        TabView {
            ProfileView()
                .tabItem {
                    Image(systemName: "person.circle")
                    Text("Profile")
            }
            
            // All ads
            AllAdsView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")

            }
            SearchView()
                .tabItem {
                    Image(systemName: "magnifyingglass")
                    Text("Search")
            }
        }
    }
    
}

struct AllAdsView: View {
    
    var body: some View {
        Text("All Ads view")
    }
    
}

struct SearchView: View {
    
    var body: some View {
        Text("Search view")
    }
    
}


struct ConsultantHomeView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultantHomeView()
    }
}

