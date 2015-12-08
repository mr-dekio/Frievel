//
//  PasswordAuthenticator.swift
//  Frievel
//
//  Created by Andrew Gavrish on 12/8/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import Foundation

class PasswordAuthenticator {
    func authenticate(username: String, password: String) -> UserProfile? {
        let users = DataWarehouse.loadUsers()
        
        if let index = users.indexOf({ $0.credentials.username == username && $0.credentials.password == password}) {
            return users[index]
        }
        return nil
    }
}