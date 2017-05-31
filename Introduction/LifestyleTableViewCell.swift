//
//  LifestyleTableViewCell.swift
//  Introduction
//
//  Created by Aleksander on 5/13/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import UIKit

class LifestyleTableViewCell: UITableViewCell {
    
    @IBOutlet fileprivate weak var collectionView: UICollectionView!
    @IBOutlet weak var headerLabel: UILabel!
    
}

extension LifestyleTableViewCell {
    
    override func awakeFromNib() {
        
    }
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate>(_ dataSourceDelegate: D, forRow row: Int) {
        
        collectionView.delegate = dataSourceDelegate
        collectionView.dataSource = dataSourceDelegate
        collectionView.tag = row
        collectionView.setContentOffset(collectionView.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionView.reloadData()
        
        switch(collectionView.tag){
        case 0:
            headerLabel.text = "Hiking"
        case 1:
            headerLabel.text = "Other"
        case 2:
            headerLabel.text = "Sport"
        default:
            break
        }
    }
    
    var collectionViewOffset: CGFloat {
        set { collectionView.contentOffset.x = newValue }
        get { return collectionView.contentOffset.x }
    }
    
}
