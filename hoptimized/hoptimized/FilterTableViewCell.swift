//
//  FilterTableViewCell.swift
//  hoptimized
//
//  Created by Darshan Nagarajappa on 8/8/16.
//  Copyright © 2016 darshanproject. All rights reserved.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    // MARK: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var rankValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func chooseRankTapped(sender: AnyObject) {
    }
}
