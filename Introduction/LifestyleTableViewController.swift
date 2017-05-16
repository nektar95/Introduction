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
    let model = loadLifestyleData()
    var storedOffsets = [Int: CGFloat]()
    var tag = 0
    var index = 0
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.count
    }
        
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        index = indexPath.row

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
    
   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetails" {
            if let collectionCell: LifestyleCollectionViewCell = sender as? LifestyleCollectionViewCell{
                if let collectionView: UICollectionView = collectionCell.superview as? UICollectionView{
                    if let destinantion = segue.destination as? DetailsViewController{
                        print("Collection view at row \(collectionView.tag) selected index path \(index)")
                        destinantion.desc = model[collectionView.tag][collectionCell.tag].description
                        destinantion.imageName = model[collectionView.tag][collectionCell.tag].imageUrl
                    }
                }
            }
        }
    }}
    
extension LifestyleTableViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model[collectionView.tag].count
    }
        
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! LifestyleCollectionViewCell
        
        cell.imageView.image = UIImage(named: model[collectionView.tag][indexPath.item].imageUrl)
        
        cell.tag = indexPath.row
            
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind{
        case UICollectionElementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "LifeCollectionHeader", for: indexPath) as! UICollectionReusableView
            header.backgroundColor = UIColor.blue
            return header
        default:
            assert(false,"Unexpected elemnt kind")
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //tag = collectionView.tag
        //index = indexPath.row
       // print("Collection view at row \(collectionView.tag) selected index path \(indexPath)")
    }
}

