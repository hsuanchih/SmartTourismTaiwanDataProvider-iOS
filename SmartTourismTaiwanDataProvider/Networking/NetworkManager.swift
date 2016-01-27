//
//  NetworkManager.swift
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/15/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

import Foundation
import AFNetworking

class NetworkManager {

    // Class identifier in reverse-domain naming format
    //private let classID = NSBundle.mainBundle().bundleIdentifier! + ".NetworkManager"
    let classID = "SmartTourismTaiwanDataProvider.NetworkManager"
    
    enum RequestMethod {
        case GET
        case POST
        case PUT
        case DELETE
    }
    
    // API key, app specific
    //private static let appKey = NSBundle.mainBundle().bundleIdentifier!
    static let appKey = "SmartTourismTaiwanDataProvider"
    // API key, common
    let apiKey = "5uHMVH0nOLku77kdJE74eyNWLKKNTNCF"
    
    // Base URL
    static let baseUrl = "http://iiidata-prod.apigee.net/"
    
    // Smart Tourism resource prefix
    let smartTourismResourcePrefix = "SmartTourism/"
    
    // HTTP request operation manager initialization
    private var httpClient: AFHTTPSessionManager = {
        let httpSessionManager = AFHTTPSessionManager(baseURL: NSURL(string: baseUrl))
        httpSessionManager.responseSerializer = AFJSONResponseSerializer()
        httpSessionManager.requestSerializer = AFJSONRequestSerializer()
        httpSessionManager.requestSerializer.setValue(appKey, forHTTPHeaderField: "apiKey")
        httpSessionManager.securityPolicy.allowInvalidCertificates = true
        return httpSessionManager
    }()
    
    // Constructor - NetworkManager
    init() {
        
        // Setup network status update reporting
        httpClient.reachabilityManager.startMonitoring()
        httpClient.reachabilityManager.setReachabilityStatusChangeBlock { (status) -> Void in
            switch status {
            case .NotReachable:
                NSNotificationCenter.defaultCenter().postNotificationName("NetworkStatusNotReachable", object: self)
            case .ReachableViaWiFi, .ReachableViaWWAN:
                NSNotificationCenter.defaultCenter().postNotificationName("NetworkStatusReachableWiFiAndWWAN", object: self)
            default: break
            }
        }
    }
    
    // MARK: Network status query
    private func networkStatus() -> AFNetworkReachabilityStatus {
        return self.httpClient.reachabilityManager.networkReachabilityStatus
    }
    
    // MARK: Language support
    var supportedLanguage : String? {
        get {
            return self.httpClient.requestSerializer.valueForHTTPHeaderField("language")
        }
        set(language) {
            if language != nil {
                self.httpClient.requestSerializer.setValue(language, forHTTPHeaderField: "language")
            }
        }
    }
    
    // MARK: Generic web service request handler
    func performRequestWithMethod(
        method: RequestMethod,
        resource: String,
        parameters: AnyObject?,
        completion: ((NSError?, AnyObject?)->())?) {
            
            unowned let unownedSelf = self
            
            switch method {
            
            case .GET:
                var params = parameters as? [String:AnyObject]
                if params != nil {
                    params!["apikey"] = apiKey
                } else {
                    params = ["apikey": apiKey]
                }
                self.httpClient.GET(
                    smartTourismResourcePrefix + resource,
                    parameters: params,
                    progress: nil,
                    success: { (task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
                        
                        unownedSelf.onSuccess(
                            task,
                            responseObject: responseObject,
                            completionBlock: completion)
                        
                    }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                        
                        unownedSelf.onFailure(
                            task,
                            error: error,
                            completionBlock: completion)
                
                })
                
            case .POST:
                self.httpClient.POST(
                    smartTourismResourcePrefix + resource + "?apikey=" + apiKey,
                    parameters: parameters,
                    progress: nil,
                    success: { (task: NSURLSessionDataTask, responseObject: AnyObject?) -> Void in
                        
                        unownedSelf.onSuccess(
                            task,
                            responseObject: responseObject,
                            completionBlock: completion)
                        
                    }, failure: { (task: NSURLSessionDataTask?, error: NSError) -> Void in
                        
                        unownedSelf.onFailure(
                            task,
                            error: error,
                            completionBlock: completion)
                        
                })
                
            case .PUT, .DELETE: break
            }
    }
    
    
    // MARK: Web service request callback
    func onSuccess(
        task: NSURLSessionDataTask,
        responseObject: AnyObject!,
        completionBlock:((NSError?, AnyObject?)->())?) {
            
            if let completion = completionBlock {
                let response = task.response as! NSHTTPURLResponse
                
                if (response.statusCode == 200) {
                    
                    completion(nil, responseObject)
                } else {
                    
                    completion(
                        NSError(
                            domain: classID,
                            code: 0,
                            userInfo: ["statusCode":String(response.statusCode)]),
                        nil)
                }
            }
    }
    
    func onFailure(
        operation: NSURLSessionDataTask?,
        error: NSError!,
        completionBlock:((NSError?, AnyObject?)->())?) {
            if let completion = completionBlock {
                completion(error, nil)
            }
    }
}
