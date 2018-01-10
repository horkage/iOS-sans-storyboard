//
//  TableViewCell.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/28/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    // there is no need to create an explicit view for this cell because 
    // UITableViewCell already gives us .contentview.
    var cellImageView = UIImageView(frame: CGRect(x:0, y:0, width:75, height:75))
    var cellLabel = UILabel()
    
    var progressView: UIProgressView!
    var progressLabel: UILabel?
    var timer: Timer?
    var currentDuration: Int?
    var totalDuration: Int?

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(cellImageView)
        cellImageView.translatesAutoresizingMaskIntoConstraints = false
        cellImageView.backgroundColor = UIColor.cyan
        cellImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10).isActive = true
        cellImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        
        contentView.addSubview(cellLabel)
        cellLabel.textColor = UIColor.red
        cellLabel.translatesAutoresizingMaskIntoConstraints = false
        cellLabel.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor).isActive = true
        
        progressView = UIProgressView(progressViewStyle: .default)
        progressView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(progressView)
        progressView.leadingAnchor.constraint(equalTo: cellImageView.trailingAnchor).isActive = true
        progressView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        progressView.topAnchor.constraint(equalTo: cellLabel.bottomAnchor).isActive = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func kickOffTimer(guyId: Int) {
        /*
        startTimer(guyId: guyId)
        */
    }
    
    func startTimer(guyId: Int) {
        /*
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.updateTimer), userInfo: nil, repeats: true)
        timer?.guyId = guyId
        appDelegate.timers.append(timer!)
        */
    }
    
    func updateTimer() {
        /*
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
        */
    }
}
