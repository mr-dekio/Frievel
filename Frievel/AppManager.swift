//
//  AppManager.swift
//  Frievel
//
//  Created by Andrew Gavrish on 12/8/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import Foundation

class AppManager {
    static let sharedInstance = AppManager()
    private init() {}
    
    var currentUser: UserProfile?
    
    
}