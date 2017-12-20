//
//  Timer+TimerProps.swift
//  NoStoryboard
//
//  Created by Michael Wood on 12/20/17.
//  Copyright © 2017 Michael Wood. All rights reserved.
//

import Foundation

extension Timer {
    private struct TimerProps {
        static var guyId:Int? = 0
    }
    
    var guyId: Int? {
        get {
            return objc_getAssociatedObject(self, &TimerProps.guyId) as? Int
        }
        set {
            if let unwrappedValue = newValue {
                objc_setAssociatedObject(self, &TimerProps.guyId, unwrappedValue as Int?, .OBJC_ASSOCIATION_COPY_NONATOMIC)
            }
        }
    }
}
