//
//  LifestyleTableViewController.swift
//  Introduction
//
//  Created by Aleksander on 5/13/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import UIKit

class LifestyleTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    let model = generateRandomData()
    var storedOffsets = [Int: CGFloat]()
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            
        return cell
    }
        
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            
        guard let tableViewCell = cell as? LifestyleTableViewCell else { return }
            
        tableViewCell.setCollectionViewDataSourceDelegate(self, forRow: indexPath.row)
        tableViewCell.collectionViewOffset = storedOffsets[indexPath.row] ?? 0
    }
        
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            
        guard let tableViewCell = cell as? LifestyleTableViewCell else { return }
            
        storedOffsets[indexPath.row] = tableViewCell.collectionViewOffset
    }
}
    
extension LifestyleTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model[collectionView.tag].count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            
        cell.backgroundColor = model[collectionView.tag][indexPath.item]
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

