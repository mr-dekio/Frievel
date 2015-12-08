//
//  MainViewController.swift
//  Frievel
//
//  Created by Maxim Galayko on 11/11/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var photoImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    let currentUser = AppManager.sharedInstance.currentUser!
    
    private (set) var friendsList = [UserProfile]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        
        setupFriendsCollectionViewFlowLayout()
        setupAppearance()
        
        nameLabel.text = currentUser.name
        photoImageView.image = currentUser.avatar
        levelLabel.text = "\(currentUser.level)"
        rating.text = "\(currentUser.rating)"
        
        
        friendsList = DataWarehouse.loadUsers()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Appearance
    
    func setupAppearance() {
        friendsCollectionView.layer.borderColor = UIColor.whiteColor().CGColor
        friendsCollectionView.layer.borderWidth = 1
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return friendsList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "friendsCollectionCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FriendCollectionViewCell
        
        let currentFriend = friendsList[indexPath.row]
        
        cell.imageView.image = UIImage(named: "user")
        cell.nameLabel.text = currentFriend.name
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func setupFriendsCollectionViewFlowLayout() {
        let collectionFlowLayout = friendsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        collectionFlowLayout.scrollDirection = .Horizontal
    }
    
    // MARK: - User actions

    @IBAction func showUserTrips(sender: AnyObject) {
    }

    @IBAction func findTrip(sender: AnyObject) {
    }

    @IBAction func addTrip(sender: AnyObject) {
    }
    
    
    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let myTripsVC = segue.destinationViewController as? ShowTableViewController {
            myTripsVC.records =  DataWarehouse.loadTripRecords().filter({
                $0.user.name == currentUser.name
            })
        }
    }


}

extension MainViewController {
    func generateFriends() {
//        let names = ["Andrew", "Victor", "Max", "Roman", "Sergiy"]
//        
//        for name in names {
//            friendsList.append(UserProfile(name: name))
//        }
    }
}
