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
    @IBOutlet weak var surnameLabel: UILabel!
    @IBOutlet weak var levelLabel: UILabel!
    @IBOutlet weak var friendsCollectionView: UICollectionView!
    
    var friendsList: [UserProfile] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        photoImageView.layer.cornerRadius = photoImageView.frame.size.width / 2
        
        setupFriendsCollectionViewFlowLayout()
        setupAppearance()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Appearance
    
    func setupAppearance() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: backgroundImageName)!)
        
        friendsCollectionView.layer.borderColor = UIColor.whiteColor().CGColor
        friendsCollectionView.layer.borderWidth = 1
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    // MARK: - UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10 // friendsList.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let reuseIdentifier = "friendsCollectionCell"
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! FriendCollectionViewCell
        
//        let currentFriend = friendsList[indexPath.row]
//        
//        cell.imageView.image = currentFriend.photo
//        cell.nameLabel.text = currentFriend.fullname
        
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
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
