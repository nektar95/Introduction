//
//  DetailsViewController.swift
//  Introduction
//
//  Created by Aleksander on 5/14/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet var photoImageView: UIImageView!
    @IBOutlet var descriptionLabel: UILabel!
    
    var imageName = ""
    var desc = ""

    override func viewDidLoad() {
        super.viewDidLoad()

        descriptionLabel.text = desc
        photoImageView.image = UIImage(named: imageName)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
