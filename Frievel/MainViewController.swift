//
//  MainViewController.swift
//  Frievel
//
//  Created by Maxim Galayko on 11/11/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    var friendsList: [UserProfile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func showUserTrips(sender: AnyObject) {
    }

    @IBAction func findTrip(sender: AnyObject) {
    }

    @IBAction func addTrip(sender: AnyObject) {
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
