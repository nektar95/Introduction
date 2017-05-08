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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
}
