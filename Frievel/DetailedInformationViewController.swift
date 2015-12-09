//
//  DetailedInformationViewController.swift
//  Frievel
//
//  Created by Andrew Gavrish on 12/9/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class DetailedInformationViewController: UIViewController {
    var record: TripRecord?
    
    @IBOutlet weak var photo: UIImageView!

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var userLabel: UILabel!
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        initialiseUI()
    }
    
    func initialiseUI() {
        photo.image = record?.images[0] ?? UIImage(named: "Image6")
        
        titleLabel.text = record?.title
        descriptionLabel.text = record?.description
        
        ratingLabel.text = "\(record!.rating)"
        budgetLabel.text = "\(record!.budget)"
        userLabel.text = record?.user.name
    }
    
}
