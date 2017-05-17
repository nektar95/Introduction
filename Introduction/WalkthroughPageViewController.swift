//
//  WalkthroughPageViewController.swift
//  Introduction
//
//  Created by Aleksander on 5/7/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import UIKit
import Lottie

class WalkthroughPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    var pages:[WalkthroughPage] = [
        WalkthroughPage(heading: "Hi!",imageUrl: "https://raw.githubusercontent.com/nektar95/Introduction/master/Introduction/Assets.xcassets/lottie/outline_user.dataset/outline_user.json"),
        WalkthroughPage(heading: "It's simple portfolio app",imageUrl: "https://raw.githubusercontent.com/nektar95/Introduction/master/Introduction/Assets.xcassets/Simulator%20Screen%20Shot%20May%2016%2C%202017%2C%2011.56.44%20AM_iphone6splussilver_portrait.png"),
        WalkthroughPage(heading: "Let's start!",imageUrl: "https://raw.githubusercontent.com/nektar95/Introduction/master/Introduction/Assets.xcassets/lottie/colorline.dataset/colorline.json")]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataSource = self
        
        if let startingViewController = contentViewController(at: 0) {
            setViewControllers([startingViewController], direction: .forward, animated: true, completion: nil)
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! WalkthroughContentViewController).index
        index -= 1
        
        
        return contentViewController(at: index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        var index = (viewController as! WalkthroughContentViewController).index
        index += 1
        
        return contentViewController(at: index)
    }
    
    func contentViewController(at index: Int) -> WalkthroughContentViewController? {
        if index < 0 || index >= pages.count {
            return nil
        }
        
        if let pageContentViewController = storyboard?.instantiateViewController(withIdentifier: "WalkthroughContentViewController") as? WalkthroughContentViewController {
            
            pageContentViewController.imageFile = pages[index].imageUrl
            pageContentViewController.heading = pages[index].heading
            //NSLog(pages[index].heading)
            pageContentViewController.index = index
            
            return pageContentViewController
        }
        
        return nil
    }
    
    func forward(index: Int) {
        if let nextViewController = contentViewController(at: index + 1) {
            setViewControllers([nextViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

}
