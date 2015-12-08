//
//  UserProfile.swift
//  Frievel
//
//  Created by Maxim Galayko on 11/11/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit


class UserCredentials {
    var username: String
    var password: String
    var email: String
    
    init (username: String, password: String, email: String) {
        self.username = username
        self.password = password
        self.email = email
    }
}

class UserProfile: NSObject {
    var name: String = ""
    var surname: String?
    var avatar: UIImage?
    var level: Int
    var rating: Int
    var credentials: UserCredentials
    
    var fullname: String {
        guard let surname = surname else { return name }
        return name + " " + surname
    }
    
    init(name: String, surname: String, avatar: UIImage?, level: Int, rating: Int, credentials: UserCredentials) {
        self.name = name
        self.surname = surname
        self.avatar = avatar ?? UIImage(named: "user")
        self.level = level
        self.rating = rating
        self.credentials = credentials
    }

}