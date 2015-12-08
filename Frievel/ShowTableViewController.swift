//
//  ShowTableViewController.swift
//  Frievel
//
//  Created by Andrew Gavrish on 12/8/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class ShowTableViewController: UITableViewController {
    var records = [TripRecord]()
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBarHidden = false
        navigationController?.title = "Search Results"
       
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("cell") as! TripCell!
        let presenter = records[indexPath.row]
        cell.title.text = presenter.title
        cell.shortDescription.text = presenter.description
        cell.rating.text = "\(presenter.rating)"
        cell.pictureView.image = presenter.images[0]
        cell.userName.text = presenter.user.name
        cell.budget.text = "\(presenter.budget)"
        
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }
}

