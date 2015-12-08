//
//  ShowTableViewController.swift
//  Frievel
//
//  Created by Andrew Gavrish on 12/8/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class ShowTableViewController: UITableViewController {
    private (set) var presenters = [TripPresenter]()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = false
        navigationController?.title = "Search Results"
        fillArray()
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenters.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TripCell!
        let presenter = presenters[indexPath.row]
        cell.title.text = presenter.title
        cell.shortDescription.text = presenter.shorttDescription
        cell.rating.text = "\(presenter.rating)"
        cell.pictureView.image = UIImage(named: presenter.image)
        cell.userName.text = presenter.user.name
        cell.budget.text = "\(presenter.budget)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
}

extension ShowTableViewController {
    func fillArray() {
        for i in 0...9 {
            let title = "Place \(i)"
            let description = "Awesome description"
            let rating: Int = Int(arc4random() % 100)
            let budget: Int = Int(arc4random() % 4000)
            let image = "Image\(i)"
            let user = UserProfile(name: "User\(i)")
            
            presenters.append(TripPresenter(title: title, shorttDescription: description, image: image, rating: rating, numberOfComments: 100, user: user, budget: budget))
        }
    }
}

