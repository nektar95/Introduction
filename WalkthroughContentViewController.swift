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
        let screenWidth = UIScreen.main.bounds.width
        
        switch index {
        case 0:
            forwardButton.setTitle("NEXT", for: .normal)
            if let animationView = LOTAnimationView(contentsOf: URL(string: imageFile)!) {
                animationView.frame = CGRect(x: 0, y: 0, width: screenWidth*0.75, height: screenWidth*0.75)
                animationView.center = self.view.center
                
                animationView.loopAnimation = true
                animationView.contentMode = .scaleAspectFill
                animationView.animationSpeed = 0.5
                
                let minimizeTransform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                animationView.transform = minimizeTransform
                UIView.animate(withDuration: 3.0, delay: 0.0, options: [.repeat, .autoreverse], animations: {
                    animationView.transform = CGAffineTransform.identity
                }, completion: nil)
                
                view.addSubview(animationView)
                
                animationView.play()
            }
        case 1:
            forwardButton.setTitle("NEXT", for: .normal)
            let url = URL(string: imageFile)
            contentImage.kf.setImage(with: url)
        case 2:
            if let animationView = LOTAnimationView(contentsOf: URL(string: imageFile)!) {
                animationView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: screenWidth)
                animationView.center = self.view.center
                animationView.loopAnimation = true
                animationView.animationSpeed = 0.5
                animationView.contentMode = .scaleAspectFill
                
                view.addSubview(animationView)
                
                animationView.play()
            }
            if let animationView1 = LOTAnimationView(contentsOf: URL(string: imageFile)!) {
                animationView1.frame = CGRect(x: 0, y: 0, width: 200, height: 250)
                animationView1.center = self.view.center
                animationView1.loopAnimation = true
                animationView1.contentMode = .scaleAspectFill
                
                view.addSubview(animationView1)
                
                animationView1.play()
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
