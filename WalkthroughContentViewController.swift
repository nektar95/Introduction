//
//  WalkthroughContentViewController.swift
//  Introduction
//
//  Created by Aleksander on 5/7/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import UIKit
import Kingfisher
import Lottie

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
        
        pageControl.currentPage = index
        
        switch index {
        case 0:
            forwardButton.setTitle("NEXT", for: .normal)
            if let animationView = LOTAnimationView(contentsOf: URL(string: imageFile)!) {
                animationView.frame = CGRect(x: 0, y: 0, width: 275, height: 275)
                animationView.center = self.view.center
                
                animationView.loopAnimation = true
                animationView.contentMode = .scaleAspectFill
                animationView.animationSpeed = 0.5
                
                // Applying UIView animation
                let minimizeTransform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                animationView.transform = minimizeTransform
                UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
                    animationView.transform = CGAffineTransform.identity
                }, completion: nil)
                
                //view.backgroundColor = UIColor.white
                view.addSubview(animationView)
                
                animationView.play()
            }
        case 1:
            forwardButton.setTitle("NEXT", for: .normal)
            let url = URL(string: imageFile)
            contentImage.kf.setImage(with: url)
        case 2:
            if let animationView = LOTAnimationView(name: "servishero_loading") {
                animationView.frame = CGRect(x: 0, y: 0, width: 400, height: 400)
                animationView.center = self.view.center
                animationView.contentMode = .scaleAspectFill
                
                view.addSubview(animationView)
                
                animationView.play()
            }
            forwardButton.setTitle("DONE", for: .normal)
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
