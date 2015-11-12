//
//  FriendCollectionViewCell.swift
//  Frievel
//
//  Created by Maxim Galayko on 11/11/15.
//  Copyright © 2015 Maxim Galayko. All rights reserved.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        imageView.layer.cornerRadius = imageView.frame.width / 2
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
