//
//  MixedHomeView.swift
//  Consultant
//
//

import Foundation
import SwiftUI

//maybe a consultant can have their own home view with all adverisements
//and a check if they are also employers - a button to add advertisements
//if the only role is employer - they only have a button to create an ad
//and maybe show their own ads, that they created?

import Foundation
import SwiftUI

struct MixedHomeView: View {
    
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
            CreateAdView()
                .tabItem {
                    Image(systemName: "plus")
                    Text("Advertise")
            }
        }
    }
    
}

struct MixedHomeView_Previews: PreviewProvider {
    static var previews: some View {
        MixedHomeView()
    }
}

