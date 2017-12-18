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
    var blankLabel = UILabel()
    
    var progressView: UIProgressView?  // these are "strong" refs
    var progressLabel: UILabel?
    var timer: Timer?
    var currentDuration: Int?
    var totalDuration: Int?
    
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
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView?.translatesAutoresizingMaskIntoConstraints = false
        testView.addSubview(progressView!)
        progressView?.leadingAnchor.constraint(equalTo: testImageView.trailingAnchor).isActive = true
        progressView?.trailingAnchor.constraint(equalTo: testView.trailingAnchor).isActive = true
        progressView?.topAnchor.constraint(equalTo: testLabel.bottomAnchor).isActive = true
    }
    
    /*
    DispatchQueue.main.async {
    this.progressBar.setProgress(Float(this.counter) / this.denominator, animated: true)
    }
    */
    
    func kickOffTimer() {
        startTimer()
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
    }
    
    func updateTimer() {
        if (self.progressView?.progress.isLessThanOrEqualTo(1.0))! {
            currentDuration = currentDuration! + 1
            let test = Float(currentDuration!) / Float(totalDuration!)
            print(test)
            self.progressView?.setProgress(Float(currentDuration!) / Float(totalDuration!), animated: true)
        } else {
            print("invalidating timer")
            timer?.invalidate()
            timer = nil
        }
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
