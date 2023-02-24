//
//  HomeView.swift
//  Consultant
//

import SwiftUI

struct TestUser {
    let isEmployer: Bool
    let isConsultant: Bool
}

struct HomeView: View {
//    @ObservedObject var userService = UserService()
    
    let user = TestUser(isEmployer: true, isConsultant: false)
    
    var body: some View {
        if (user.isEmployer && user.isConsultant) {
            MixedHomeView()
        } else {
            if (user.isEmployer) {
                EmployerHomeView()
            }
            else {
                ConsultantHomeView()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
