//
//  UserProfile.swift
//  Frievel
//
//  Created by Maxim Galayko on 11/11/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class UserProfile: NSObject {
    
    var name: String = ""
    var surname: String?
    var photo: UIImage?
    
    var fullname: String {
        guard let surname = surname else { return name }
        return name + " " + surname
    }
    
    init(name: String) {
        self.name = name
    }

}
