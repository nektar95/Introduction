//
//  TableViewController.swift
//  Introduction
//
//  Created by Aleksander on 5/8/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items = [[String:String]]()
    var expandRows = Set<Int>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let nib = UINib.init(nibName: "ProfileTableViewCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "cell")
        
        self.items = loadPlist()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadPlist()-> [[String:String]]{
    let path = Bundle.main.path(forResource: "list", ofType: "plist")
        return NSArray.init(contentsOf: URL.init(fileURLWithPath: path!)) as! [[String:String]]
    }
    
    var selectedIndex:IndexPath?
    
    func reloadRows(){
        self.tableView.reloadRows(at: [selectedIndex!], with: .automatic)
    }
}
extension TableViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath

        if expandRows.contains(indexPath.row){
            self.expandRows.remove(indexPath.row)
            
        } else {
            self.expandRows.insert(indexPath.row)
        }

        self.reloadRows()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! ProfileTableViewCell
        
        let item = self.items[indexPath.row]
        
        cell.titleLabel.text = item["title"]
        cell.descriptionLabel.text = item["description"]
        cell.thumbImage.image = UIImage.init(named: item["image"]!)
        cell.expandLabel.text = "Hide"
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if expandRows.contains(indexPath.row) && selectedIndex==indexPath{
            self.expandRows.removeAll()
            self.expandRows.insert(indexPath.row)
            return 180
        }
        return 70
    }
    
    
    
}
