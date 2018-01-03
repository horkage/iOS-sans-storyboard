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
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("guys")
    
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
        /*
        guard
            let id = decoder.decodeObject(forKey: "id") as? Int,
            let name = decoder.decodeObject(forKey: "name") as? String,
            let image = decoder.decodeObject(forKey: "image") as? UIImage,
            let totalDuration = decoder.decodeObject(forKey: "totalDuration") as? Int,
            let currentDuration = decoder.decodeObject(forKey: "currentDuration") as? Int,
            let then = decoder.decodeObject(forKey: "then") as? Int,
            let now = decoder.decodeObject(forKey: "now") as? Int
        else { return nil }
        */
        
        let id = decoder.decodeInteger(forKey: "id")
        let name = decoder.decodeObject(forKey: "name")
        let image = decoder.decodeObject(forKey: "image") as? UIImage
        let totalDuration = decoder.decodeInteger(forKey: "totalDuration")
        let currentDuration = decoder.decodeInteger(forKey: "currentDuration")
        let then = decoder.decodeInteger(forKey: "then")
        let now = decoder.decodeInteger(forKey: "now")
        
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
        coder.encode(id, forKey: "id")
        coder.encode(name, forKey: "name")
        coder.encode(image, forKey: "image")
        coder.encode(totalDuration, forKey: "totalDuration")
        coder.encode(currentDuration, forKey: "currentDuration")
        coder.encode(then, forKey: "then")
        coder.encode(now, forKey: "now")
    }
}
