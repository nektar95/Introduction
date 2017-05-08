//
//  WalkthroughContentViewController.swift
//  Introduction
//
//  Created by Aleksander on 5/7/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import UIKit
import Kingfisher

class WalkthroughContentViewController: UIViewController {
    
    @IBOutlet var headingLabel: UILabel!
    @IBOutlet var contentImage: UIImageView!
    @IBOutlet var forwardButton: UIButton!
    @IBOutlet var pageControl: UIPageControl!
    
    var index = 0
    var heading = ""
    var imageFile = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        headingLabel.text = heading
        let url = URL(string: imageFile)
        contentImage.kf.setImage(with: url)
        pageControl.currentPage = index
        
        switch index {
        case 0...1: forwardButton.setTitle("NEXT", for: .normal)
        case 2: forwardButton.setTitle("DONE", for: .normal)
        default: break
        }

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func nextButtonTapped(sender: UIButton) {
        
        switch index {
        case 0...1: // Next Button
            let pageViewController = parent as! WalkthroughPageViewController
            pageViewController.forward(index: index)
            
        case 2: // Done Button
            UserDefaults.standard.set(true, forKey: "hasViewedWalkthrough")
            dismiss(animated: true, completion: nil)
            
        default: break
            
        }
    }

}
