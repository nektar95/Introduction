//
//  ProfileTableViewCell.swift
//  Introduction
//
//  Created by Aleksander on 5/8/17.
//  Copyright © 2017 Aleksander. All rights reserved.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    @IBOutlet weak var thumbImage: UIImageView!

    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var expandLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var isExpanded = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
            let tap = UITapGestureRecognizer(target: self, action: #selector(ProfileTableViewCell.tapFunction))
            descriptionLabel.isUserInteractionEnabled = true
            descriptionLabel.addGestureRecognizer(tap)
        
    }
    
    func tapFunction(sender:UITapGestureRecognizer) {
        if titleLabel.text == "Github" {
            let settingsUrl = NSURL(string:"https://github.com/nektar95")! as URL
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        }
        if titleLabel.text == "Enduhub" {
            let settingsUrl = NSURL(string:"https://enduhub.com/en/")! as URL
            UIApplication.shared.open(settingsUrl, options: [:], completionHandler: nil)
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
