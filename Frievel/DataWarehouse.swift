//
//  DataWarehouse.swift
//  Frievel
//
//  Created by Andrew Gavrish on 12/8/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class DataWarehouse {
    
    static func loadUsers() -> [UserProfile] {
        let name = ["Andrew", "Max", "Roman", "Volodumyr", "John"]
        let surname = ["Gavrish", "Galayko", "Karpinskiy", "Lesuk", "Gage"]
        let credentials = [UserCredentials(username: "agavrysh", password: "iomaguire", email: "drako@gmail.com"),
            UserCredentials(username: "galayko2012", password: "qwerty", email: "galay@gmail.com"),
            UserCredentials(username: "karpostar", password: "123", email: "karpo@gmail.com"),
            UserCredentials(username: "vovan", password: "password", email: "vova@gmail.com"),
            UserCredentials(username: "john", password: "iomaguire", email: "john@gmail.com")]
        
        var profiles = [UserProfile]()
        for i in 0...(name.count - 1) {
            let profile = UserProfile(name: name[i], surname: surname[i], avatar: nil, level: Int(arc4random()%45), rating: Int(arc4random()%100), credentials: credentials[i])
            profiles.append(profile)
        }
        return profiles
    }
    
    
    static func loadTripRecords() -> [TripRecord] {
        var records = [TripRecord]()
        
        let titles = ["Dream trip", "Trip to future", "My perfect vacation"]
        
        let descriptions = ["Market…in London, history collides with art, fashion, food, and good British ale. A perfect day is different for everyone: culture aficionados shouldn't miss the Tate Modern and the Royal Opera House. If you love fashion, Oxford Street has shopping galore. For foodies, cream tea at Harrod’s or crispy fish from a proper chippy offers classic London flavor. Music and book buffs will love seeing Abbey Road and the Sherlock Holmes Museum (at 221B Baker Street, of course).",
            "Delectable dim sum, floating islands, and a one-of-a-kind skyline are just some of Hong Kong’s unique features. Get an eyeful of traditional Chinese architecture in Ngong Ping village, then take the tram to the tippity-top of Victoria Peak for unparalleled views. The rocks and gentle hills of Nan Lian Garden will bring you inner peace, as will a calming cup of tea in a Stanley café. Become one with everything at the Chi Lin Nunnery, a serene Buddhist complex.",
            "This city, full of colorful homes, canals and bridges, is one of Europe's most picturesque capitals. Must-sees on any visitor's itinerary include the Anne Frank House, the Van Gogh Museum and the world's only floating flower market. Rent a bike and join thousands of locals navigating Amsterdam's labyrinthine streets, or just take in the sights on foot. For an unusual and memorable alternative to hotels, consider staying in a houseboat."
        ]
        
        let serachCriterias = [SearchCriterias(country: "United Kingdom", includesHotel: true, includesEntertainment: false, includesFood: true),
        SearchCriterias(country: "China", includesHotel: false, includesEntertainment: false, includesFood: false),
        SearchCriterias(country: "Netherlands", includesHotel: true, includesEntertainment: true, includesFood: true)]
        
        let users = self.loadUsers()
        
        for i in 0...2 {
            let record = TripRecord(title: titles[i], description: descriptions[i], image: [UIImage(named:"Image\(i)")!], rating: Int(arc4random() % 100), user: users[i], budget: Int(arc4random() % 2000), searchCriterias: serachCriterias[i])
            records.append(record)
        }
        
        return records
    }
    
}