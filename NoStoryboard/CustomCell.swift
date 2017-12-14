//
//  CustomCell.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/14/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    // var cellLabel = UILabel()
    // var thisImage = UIImage()
    
    
    
    /*
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    */
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        /*
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageView)
        imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(label)
        label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor).isActive = true
        */
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
