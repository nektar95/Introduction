//
//  LifestyleCollectionViewCell.swift
//  Introduction
//
//  Created by Aleksander on 5/14/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import UIKit

class LifestyleCollectionViewCell: UICollectionViewCell {
    @IBOutlet var imageView: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.backgroundColor = UIColor.gray
    }
    
}
