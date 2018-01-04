//
//  Constant.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/27/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import Foundation

struct Constants {
    struct api {
        static let baseUrl: String = "http://10.1.20.130:9000/getGuys"
    }
    
    struct app {
        static let archiveName: String = "guys"
        static let customCellClass: String = "TableViewCell"
        static let fontLibrary: String = "FontAwesome"
        static let rowHeight: Int = 100
        
        struct data {
            static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
            static let archiveURL = documentsDirectory.appendingPathComponent(Constants.app.archiveName)
        }
        
        struct glyphs {
            static let bars: String = "\u{f0c9}"
        }
        
    }
    
    struct keys {
        static let id: String = "id"
        static let name: String = "name"
        static let image: String = "image"
        static let imageUrl: String = "imageUrl"
        static let totalDuration: String = "totalDuration"
        static let currentDuration: String = "currentDuration"
        static let then: String = "then"
        static let now: String = "now"
    }
}
