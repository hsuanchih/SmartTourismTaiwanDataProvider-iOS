//
//  DataParser.swift
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

import Foundation

class DataParser {

    static func parseResponseObject<T: AnyObject>(responseObject: AnyObject? ) -> T? {
        
        if let tClass = NSClassFromString(NSStringFromClass(T.self)) {
            return SmartTourismDataObjectFactory.createObjectForClass(
                tClass,
                withData: responseObject as? [NSObject:AnyObject],
                andError: nil) as? T
        }
        
        return nil
    }
    
    static func parseResponseObjectAsArray<T: AnyObject>(responseObject: AnyObject? ) -> [T]? {
        
        if let tClass = NSClassFromString(NSStringFromClass(T.self)) {
            return SmartTourismDataObjectFactory.createObjectArrayForClass(
                tClass,
                withArray: responseObject as? [AnyObject],
                andError: nil) as AnyObject as? [T]
        }
        
        return nil
    }
    
}
