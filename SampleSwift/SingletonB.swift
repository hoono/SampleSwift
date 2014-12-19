//
//  SingletonB.swift
//  SampleSwift
//
//  Created by Hiroyuki Ohno on 2014/12/04.
//  Copyright (c) 2014年 Hiroyuki Ohno. All rights reserved.
//

import Foundation

class SingletonB {
    
    class var sharedInstance : SingletonB {
        struct Static {
            static let instance : SingletonB = SingletonB()
        }
        return Static.instance
    }
    
    init() {
        println("BBB");
    }
    
}