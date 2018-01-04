//
//  Guy.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/13/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

// import Foundation
import UIKit

class Guy: NSObject, NSCoding {
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent(Constants.app.archiveName)

    var id: Int
    var name: String
    var image: UIImage
    var totalDuration: Int
    var currentDuration: Int
    var then: Int
    var now: Int
    
    init(id: Int, name: String, image: UIImage, totalDuration: Int, currentDuration: Int, then: Int, now: Int) {
        self.id = id
        self.name = name
        self.image = image
        self.totalDuration = totalDuration
        self.currentDuration = currentDuration
        self.then = then
        self.now = now
    }
    
    required convenience init?(coder decoder: NSCoder) {
        let id = decoder.decodeInteger(forKey: Constants.keys.id)
        let name = decoder.decodeObject(forKey: Constants.keys.name)
        let image = decoder.decodeObject(forKey: Constants.keys.image) as? UIImage
        let totalDuration = decoder.decodeInteger(forKey: Constants.keys.totalDuration)
        let currentDuration = decoder.decodeInteger(forKey: Constants.keys.currentDuration)
        let then = decoder.decodeInteger(forKey: Constants.keys.then)
        let now = decoder.decodeInteger(forKey: Constants.keys.now)
        
        self.init(
            id: id,
            name: name as! String,
            image: image!,
            totalDuration: totalDuration,
            currentDuration: currentDuration,
            then: then,
            now: now
        )
    }
    
    func encode(with coder: NSCoder) {
        coder.encode(id, forKey: Constants.keys.id)
        coder.encode(name, forKey: Constants.keys.name)
        coder.encode(image, forKey: Constants.keys.image)
        coder.encode(totalDuration, forKey: Constants.keys.totalDuration)
        coder.encode(currentDuration, forKey: Constants.keys.currentDuration)
        coder.encode(then, forKey: Constants.keys.then)
        coder.encode(now, forKey: Constants.keys.now)
    }
}
