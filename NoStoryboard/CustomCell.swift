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
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
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
    
    func kickOffTimer(guyId: Int) {
        startTimer(guyId: guyId)
    }
    
    func startTimer(guyId: Int) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        timer?.guyId = guyId
        appDelegate.timers.append(timer!)
    }
    
    func updateTimer() {
        if (self.progressView?.progress.isLess(than: 1.0))! {
            currentDuration = currentDuration! + 1

            // Animating the progress bar here like this doesn't block the app and I'm not sure why.
            // I'm not complaining, but my understanding is that animations need to be dispatched to main thread.
            // Need to understand why this works in more detail...
            self.progressView?.setProgress(Float(currentDuration!) / Float(totalDuration!), animated: true)
            
            // shouldn't it need to be this?
            //
            // DispatchQueue.main.async {
            //     this.progressBar.setProgress(Float(this.counter) / this.denominator, animated: true)
            // }
        } else {
            print("DO THIS GUY")
            print(timer?.guyId)
            self.backgroundColor = UIColor.blue
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
