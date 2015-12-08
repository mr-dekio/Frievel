//
//  TripRecord.swift
//  Frievel
//
//  Created by Andrew Gavrish on 12/8/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class TripRecord {
    private (set) var user: UserProfile
    
    private (set) var title: String
    private (set) var description: String
    private (set) var images: [UIImage]
    private (set) var budget: Int
    
    private (set) var rating: Int
    
    var searchCriterias: SearchCriterias
    
    init(title:String, description:String, image:[UIImage], rating: Int, user: UserProfile, budget: Int, searchCriterias:SearchCriterias) {
        self.title = title
        self.description = description
        self.rating = rating
        self.user = user
        self.images = image
        self.budget = budget
        self.searchCriterias = searchCriterias
    }
}

class SearchCriterias {
    var country: String? = ""
    
    var advancedSearch: Bool = false
    var includesHotel: Bool = false
    var includesEntertainment: Bool = false
    var includesFood: Bool = false
    
    init(country: String = "", includesHotel: Bool = false, includesEntertainment: Bool = false, includesFood: Bool = false) {
        self.country = country
        self.includesHotel = includesHotel
        self.includesEntertainment = includesEntertainment
        self.includesFood = includesFood
    }
}
