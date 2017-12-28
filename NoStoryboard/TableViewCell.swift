//
//  TableViewCell.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/28/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = UIColor.red
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
