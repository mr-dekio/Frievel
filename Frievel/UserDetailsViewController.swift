//
//  UserDetailsViewController.swift
//  Frievel
//
//  Created by Maxim Galayko on 11/11/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class UserDetailsViewController: UIViewController {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var numberOfFriendsLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var userImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupAppearance()
    }
    
    // MARK: - Appearance
    
    func setupAppearance() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundImageName)!)
        
        userImageView.layer.cornerRadius = userImageView.bounds.width / 2
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }

}
