//
//  VersionEntity.swift
//  SampleSwift
//
//  Created by Hiroyuki Ohno on 2014/12/04.
//  Copyright (c) 2014年 Hiroyuki Ohno. All rights reserved.
//

import Foundation

class VersionEntity : NSObject {
    var comment : NSString!
    var force_flag : NSNumber!
    var id : NSNumber!
    var url : NSString!
    var version : NSString!
    var pushed_at : NSDate!
    var created_at : NSDate!
    var updated_at : NSDate!
    
    init(jsonObject: NSDictionary) {
        super.init()
        println("VersionEntity");
        
        var error : NSError?
        
        // Loop
        /*
        for (key, value) in JSONDictionary {
            let keyName = key as NSString
            let keyValue: String = value as NSString
            
            // If property exists
            if (self.respondsToSelector(NSSelectorFromString(keyName))) {
                self.setValue(keyValue, forKey: keyName)
            }
        }
        */
        
        self.setValuesForKeysWithDictionary(jsonObject);
    }
    
    func versionKeys() -> NSArray {
        return ["id", "comment", "url", "force_flag", "version", "pushed_at", "created_at", "updated_at"];
    }
}