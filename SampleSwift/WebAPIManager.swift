//
//  WebAPIManager.swift
//  SampleSwift
//
//  Created by Hiroyuki Ohno on 2014/12/04.
//  Copyright (c) 2014年 Hiroyuki Ohno. All rights reserved.
//

import Foundation

class WebAPIManager {
    class var sharedInstance : WebAPIManager {
        struct Static {
            static let instance : WebAPIManager = WebAPIManager()
        }
        return Static.instance
    }
    
    init() {
        println("init")
    }
    
    func sendAsyncGetRequestWithUrl( url : NSString, success : (task : NSURLSessionDataTask, responseObject : AnyObject) -> Void, failure : (task : NSURLSessionDataTask, error : NSError) -> Void ) -> Bool {
        // AFHTTPSessionManager生成
        let manager:AFHTTPSessionManager = AFHTTPSessionManager()
        manager.responseSerializer = AFJSONResponseSerializer()
        
        manager.GET(url, parameters: nil, success: {
            (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
            
            // 成功通知
            success(task:task, responseObject:responseObject)
    
        }, failure: {
            (task: NSURLSessionDataTask!, error: NSError!) in
                
            // 異常通知
            failure(task:task, error: error)
        })
        
        // 要求成功
        return true;
    }

    func sendAsyncPostRequestWithUrl( url : NSString, parameters : NSDictionary, success : (task : NSURLSessionDataTask, responseObject : AnyObject) -> Void, failure : (task : NSURLSessionDataTask, error : NSError) -> Void ) -> Bool {
        // AFHTTPSessionManager生成
        let manager:AFHTTPSessionManager = AFHTTPSessionManager()
        
        manager.POST(url, parameters: parameters, success: {
            (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
            
            // 成功通知
            success(task:task, responseObject:responseObject)

        }, failure: {
            (task: NSURLSessionDataTask!, error: NSError!) in
                
            // 異常通知
            failure(task:task, error: error)
        })
        
        // 要求成功
        return true;
    }
    
}
