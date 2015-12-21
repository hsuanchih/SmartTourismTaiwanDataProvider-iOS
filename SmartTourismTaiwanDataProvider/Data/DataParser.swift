//
//  DataParser.swift
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

import Foundation

class DataParser {

    static func parseResponseObject<T>(responseObject: AnyObject? ) -> T? {
        
        if T.self is Theme.Type {
            do { return try Theme(dictionary: responseObject as? [NSObject:AnyObject]) as? T } catch { return nil }
        }
        if T.self is Activity.Type {
            do { return try Activity(dictionary: responseObject as? [NSObject:AnyObject]) as? T } catch { return nil }
        }
        if T.self is Attraction.Type {
            do { return try Attraction(dictionary: responseObject as? [NSObject:AnyObject]) as? T } catch { return nil }
        }
        if T.self is Tour.Type {
            do { return try Tour(dictionary: responseObject as? [NSObject:AnyObject]) as? T } catch { return nil }
        }
        if T.self is FoodAndDrink.Type {
            do { return try FoodAndDrink(dictionary: responseObject as? [NSObject:AnyObject]) as? T } catch { return nil }
        }
        if T.self is Array<County>.Type {
            return County.arrayOfModelsFromDictionaries(responseObject as? [AnyObject]) as? T
        }
        if T.self is Array<Theme>.Type {
            return Theme.arrayOfModelsFromDictionaries(responseObject as? [AnyObject]) as? T
        }
        if T.self is Array<Activity>.Type {
            return Activity.arrayOfModelsFromDictionaries(responseObject as? [AnyObject]) as? T
        }
        if T.self is Array<Attraction>.Type {
            return Attraction.arrayOfModelsFromDictionaries(responseObject as? [AnyObject]) as? T
        }
        if T.self is Array<Tour>.Type {
            return Tour.arrayOfModelsFromDictionaries(responseObject as? [AnyObject]) as? T
        }
        if T.self is Array<FoodAndDrink>.Type {
            return FoodAndDrink.arrayOfModelsFromDictionaries(responseObject as? [AnyObject]) as? T
        }
        return nil
    }
    
}
