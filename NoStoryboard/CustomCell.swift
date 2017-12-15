//
//  CustomCell.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/14/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    var testView = UIView()
    var testImageView = UIImageView()
    var testLabel = UILabel()
    // static var randomString = "Bob"
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.addSubview(testView)
        testView.translatesAutoresizingMaskIntoConstraints = false
        testView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        testView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        testView.heightAnchor.constraint(equalTo: self.heightAnchor).isActive = true
        
        testView.addSubview(testImageView)
        testImageView.translatesAutoresizingMaskIntoConstraints = false
        testImageView.leadingAnchor.constraint(equalTo: testView.leadingAnchor).isActive = true
        
        testView.addSubview(testLabel)
        testLabel.textColor = UIColor.red
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        testLabel.leadingAnchor.constraint(equalTo: testImageView.trailingAnchor).isActive = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
