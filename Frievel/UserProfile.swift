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

class TripPresenter {
    private (set) var title: String
    private (set) var shorttDescription: String
    private (set) var image: String
    private (set) var budget: Int
    
    private (set) var rating: Int
    private (set) var numberOfComments: Int
    
    private (set) var user: UserProfile
    
    init(title: String, shorttDescription: String,image: String,rating: Int,numberOfComments: Int,user: UserProfile, budget: Int) {
        self.title = title
        self.shorttDescription = shorttDescription
        self.rating = rating
        self.numberOfComments = numberOfComments
        self.user = user
        self.image = image
        self.budget = budget
    }
}