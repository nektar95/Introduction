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
    var isExpanded = false
    
    func didExpandCell(){
        self.isExpanded = !isExpanded
        
        self.tableView.reloadRows(at: [selectedIndex!], with: .automatic)
    }
}
extension TableViewController:UITableViewDataSource,UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.selectedIndex = indexPath
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath) as! ProfileTableViewCell

        if isExpanded{
            cell.expandLabel.text = "Expand"
            
        } else {
            cell.expandLabel.text = "Hide"
        }
        self.didExpandCell()
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
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if isExpanded && self.selectedIndex == indexPath{
            return 160
        }
        return 90
    }
    
}
