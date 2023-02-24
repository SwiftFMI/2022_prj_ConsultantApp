//
//  UserModel.swift
//  Consultant
//
//

import Foundation

struct SignUpDetails {
    
    var firstName: String;
    var lastName: String;
    var username: String;
    var isEmployer: Bool;
    var isConsultant: Bool;
    
}

extension SignUpDetails {
    
    static var new: SignUpDetails {
        SignUpDetails(firstName: "", lastName: "", username: "", isEmployer: false, isConsultant: false)
    }
    
}
