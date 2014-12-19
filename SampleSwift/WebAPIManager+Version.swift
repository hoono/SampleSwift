//
//  WebAPIManager+Version.swift
//  SampleSwift
//
//  Created by Hiroyuki Ohno on 2014/12/04.
//  Copyright (c) 2014年 Hiroyuki Ohno. All rights reserved.
//

import Foundation

extension WebAPIManager {
    /**
     * AFNetworking + NSDictionary版
     */
    func getVersion( version: NSString ) -> Bool {
        let requestURL : NSString = "http://stg.api.therapist.jp/v1/versions/latest"

        // AFHTTPRequestOperationManager生成
        let manager:AFHTTPSessionManager = AFHTTPSessionManager()
        
        manager.GET(requestURL, parameters: nil, success: {
            (task: NSURLSessionDataTask!, responseObject: AnyObject!) in
            
            // レスポンス処理
            let jsonObject:NSDictionary = responseObject as NSDictionary
            
            NSLog("%@", jsonObject)
            
            let responseResponse:NSDictionary = jsonObject["response"] as NSDictionary
            let responseDict:NSDictionary = responseResponse["result"] as NSDictionary
            let entity:VersionEntity = VersionEntity(jsonObject: responseDict)
            
            NSLog("id = %@", entity.id)
            
            return;
        }, failure: {
            (task: NSURLSessionDataTask!, error: NSError!) in
                
            // エラーログ
            NSLog("%@", error)
                
            // エラー処理
            return;
        })

        return true;
    }
    
    /**
     * AFNetworking + SwifyJSON版
     */
    func getVersion2( version: NSString ) -> Bool {
        var _wSelf : WebAPIManager = self
        let requestURL : NSString = "http://stg.api.therapist.jp/v1/versions/latest"
        
        var success = {(task : NSURLSessionDataTask, rootObject : AnyObject!) -> Void in
            // レスポンス処理
            let jsonObject:NSDictionary = rootObject as NSDictionary
            
            NSLog("%@", jsonObject)

            let json = JSON(rootObject)
            
            for (key: String, subJson: JSON) in json {
                // keyにはJSONのキーが設定されている。
                println(key)
                for (index: String, subJsonHead: JSON) in subJson {
                    println(index)
                    for (index2: String, subJsonBody: JSON) in subJsonHead {
                        print(index2)
                        print(":")
                        println(subJsonBody)
                    }
                }
            }
            
            
            /*
            if let status = json["status"].int16 {
                println(status)
            }
            if let comment = json["response"]["result"]["comment"].string {
                println(comment)
            }
            if let force_flag = json["response"]["result"]["force_flag"].int16 {
                println(force_flag)
            }
            if let id = json["response"]["result"]["id"].int16 {
                println(id)
            }
            if let url = json["response"]["result"]["id"].string {
                println(url)
            }
            if let version = json["response"]["result"]["version"].string {
                println(version)
            }
            */
        }
        
        var failure = {(task : NSURLSessionDataTask, error : NSError!) -> Void in
            // エラーログ
            NSLog("%@", error)
        }
        
        return sendAsyncGetRequestWithUrl(requestURL, success, failure)
    }

    func getVersion3( version: NSString ) -> Bool {
        var _wSelf : WebAPIManager = self
        let requestURL : NSString = "http://webservice.recruit.co.jp/relax/salon/v1?response_reserve=1&count=15&order=3&address=%E9%8A%80%E5%BA%A7&key=d80cc5011c92e61d&format=json"

        var request = NSURLRequest(URL: NSURL(string: requestURL)!)
        NSURLConnection.sendAsynchronousRequest(request,queue:NSOperationQueue.mainQueue(),completionHandler:{
            (res: NSURLResponse!, data: NSData!, error: NSError!) in
            let json = JSON(data: data)
            
            if let url = json["results"]["salon"][0]["urls"]["pc"].string{
                println(url)
            }
            if let image = json["results"]["salon"][0]["mood"][0]["photo"].string{
                println(image)
            }
            if let caption = json["results"]["salon"][0]["mood"][0]["caption"].string{
                println(caption)
            }
        })
        
        return true
    }

}
