//
//  myTableViewCell.swift
//  Quick Share
//
//  Created by Abhishek Thakur on 12/05/19.
//  Copyright © 2019 Abhishek Thakur. All rights reserved.
//

import UIKit

class myTableViewCell: UITableViewCell {

    @IBOutlet weak var myImageview: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
