//
//  SmartTourismDataProvider.swift
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/15/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

import Foundation
import JSONModel

class SmartTourismDataProvider {
    
    static let instance = SmartTourismDataProvider()
    
    /**
     * Reference to NetworkManager instance
     */
    let networkManager : NetworkManager = {
        return NetworkManager()
    }()
    

    /**
     * Queries a complete list of counties
     */
    func getCountyList(
        completionBlock:((NSError?, [County]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.County.stringValue(),
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Queries a complete list of themes
     */
    func getThemeList(
        completionBlock:((NSError?, [Theme]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Theme.stringValue(),
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Gets theme info for a particular theme ID
     */
    func getThemeByID(
        themeID: String,
        completionBlock:((NSError?, Theme?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Theme.stringValue() + themeID + "/",
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Gets theme info for a particular theme ID relative to specific location
     */
    func getThemeByID(
        themeID: String,
        latitude: Float,
        longitude: Float,
        completionBlock:((NSError?, Theme?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Theme.stringValue() + themeID + "/",
                parameters: [
                    "latitude": latitude,
                    "longitude": longitude
                ],
                completionBlock: completionBlock)
    }
    
    /**
     * Finds a particular activity by activity ID
     */
    func getActivityByID(
        activityID: String,
        completionBlock:((NSError?, Activity?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Activity.stringValue() + activityID + "/",
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Queries a complete list of activities
     */
    func getActivityList(
        completionBlock:((NSError?, [Activity]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Activity.stringValue(),
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Gets the top ten activities
     */
    func getTopTenActivities(
        completionBlock:((NSError?, [Activity]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Activity.stringValue() + CatResourceURI.FindTopTen.stringValue(),
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of activities for a county
     */
    func getActivitiesByCountyID(
        countyID: String,
        completionBlock:((NSError?, [Activity]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Activity.stringValue() + CatResourceURI.FindByCounty.stringValue(),
                parameters: [ "countyid" : countyID ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of activities for a theme
     */
    func getActivitiesByThemeID(
        themeID: String,
        completionBlock:((NSError?, [Activity]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Activity.stringValue() + CatResourceURI.FindByTheme.stringValue(),
                parameters: [ "themeid" : themeID ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of activities specified by a group of criteria
     */
    func getActivitiesByCriteria(
        themeID: String,
        countyID: String,
        latitude: Float,
        longitude: Float,
        offset: Int,
        count: Int,
        completionBlock:((NSError?, [Activity]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Activity.stringValue() + CatResourceURI.FindByCriteria.stringValue(),
                parameters: [
                    "themeid"  : themeID,
                    "countyid" : countyID,
                    "latitude" : latitude,
                    "longitude": longitude,
                    "offset"   : offset,
                    "count"    : count
                ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of activities within a the specified geofence
     */
    func getActivitiesInGeofence(
        latitude: Float,
        longitude: Float,
        distance: Int,
        completionBlock:((NSError?, [Activity]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Activity.stringValue() + CatResourceURI.FindByNearBy.stringValue(),
                parameters: [
                    "latitude" : latitude,
                    "longitude": longitude,
                    "distance" : distance
                ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of activities as specified by rank
     */
    func getActivitiesByRank(
        rank: Int,
        completionBlock:((NSError?, [Activity]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Activity.stringValue() + CatResourceURI.FindByRank.stringValue(),
                parameters: [ "rank" : rank ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of activities for a specific date
     */
    func getActivitiesByDate(date: String,
        completionBlock:((NSError?, [Activity]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Activity.stringValue() + CatResourceURI.FindByDate.stringValue(),
                parameters: [ "date" : date ],
                completionBlock: completionBlock)
    }
    
    /**
     * Finds a particular attraction by attraction ID
     */
    func getAttractionByID(
        attractionID: String,
        completionBlock:((NSError?, Attraction?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Attraction.stringValue() + attractionID + "/",
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of attractions by theme ID
     */
    func getAttractionsByThemeID(
        themeID: String,
        completionBlock:((NSError?, [Attraction]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Attraction.stringValue() + CatResourceURI.FindByTheme.stringValue(),
                parameters: [ "themeid" : themeID ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of attractions as specified by rank
     */
    func getAttractionsByRank(
        rank: Int,
        completionBlock:((NSError?, [Attraction]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Attraction.stringValue() + CatResourceURI.FindByRank.stringValue(),
                parameters: [ "rank" : rank ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of attractions for a county
     */
    func getAttractionsByCountyID(
        countyID: String,
        completionBlock:((NSError?, [Attraction]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Attraction.stringValue() + CatResourceURI.FindByCounty.stringValue(),
                parameters: [ "countyid" : countyID ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets the top ten attractions
     */
    func getTopTenAttractions(
        completionBlock:((NSError?, [Attraction]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Attraction.stringValue() + CatResourceURI.FindTopTen.stringValue(),
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of attractions specified by a group of criteria
     */
    func getAttractionsByCriteria(
        themeID: String,
        countyID: String,
        latitude: Float,
        longitude: Float,
        offset: Int,
        count: Int,
        completionBlock:((NSError?, [Attraction]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Attraction.stringValue() + CatResourceURI.FindByCriteria.stringValue(),
                parameters: [
                    "themeid"  : themeID,
                    "countyid" : countyID,
                    "latitude" : latitude,
                    "longitude": longitude,
                    "offset"   : offset,
                    "count"    : count
                ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of attractions within a the specified geofence
     */
    func getAttractionsInGeofence(
        latitude: Float,
        longitude: Float,
        distance: Int,
        completionBlock:((NSError?, [Attraction]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Attraction.stringValue() + CatResourceURI.FindByNearBy.stringValue(),
                parameters: [
                    "latitude" : latitude,
                    "longitude": longitude,
                    "distance" : distance
                ],
                completionBlock: completionBlock)
    }
    
    /**
     * Finds a particular tour by tourID
     */
    func getTourByID(
        tourID: String,
        completionBlock:((NSError?, Tour?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Tour.stringValue() + tourID + "/",
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Queries a list of tours
     */
    func getTourList(
        completionBlock:((NSError?, [Tour]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Tour.stringValue(),
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of tours by attraction ID
     */
    func getToursByAttractionID(
        attractionID: String,
        completionBlock:((NSError?, [Tour]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Tour.stringValue() + CatResourceURI.FindByAttraction.stringValue(),
                parameters: [ "attractionid" : attractionID ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of tours by theme ID
     */
    func getToursByThemeID(
        themeID: String,
        completionBlock:((NSError?, [Tour]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.Tour.stringValue() + CatResourceURI.FindByTheme.stringValue(),
                parameters: [ "themeid" : themeID ],
                completionBlock: completionBlock)
    }
    
    /**
     * Finds a particular food & drink venue by ID
     */
    func getFoodAndDrinkByID(
        foodAndDrinkID: String,
        completionBlock:((NSError?, FoodAndDrink?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.FoodAndDrink.stringValue() + foodAndDrinkID + "/",
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of food & drink venues by theme ID
     */
    func getFoodAndDrinkByThemeID(
        themeID: String,
        completionBlock:((NSError?, [FoodAndDrink]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.FoodAndDrink.stringValue() + CatResourceURI.FindByTheme.stringValue(),
                parameters: [ "themeid" : themeID ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of food & drink venues by county ID
     */
    func getFoodAndDrinkByCountyID(
        countyID: String,
        completionBlock:((NSError?, [FoodAndDrink]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.FoodAndDrink.stringValue() + CatResourceURI.FindByCounty.stringValue(),
                parameters: [ "countyid" : countyID ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets the top ten food & drink venues
     */
    func getTopTenFoodAndDrink(
        completionBlock:((NSError?, [FoodAndDrink]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.FoodAndDrink.stringValue() + CatResourceURI.FindTopTen.stringValue(),
                parameters: nil,
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of food & drink venues specified by a group of criteria
     */
    func getFoodAndDrinkByCriteria(
        themeID: String,
        countyID: String,
        latitude: Float,
        longitude: Float,
        offset: Int,
        count: Int,
        completionBlock:((NSError?, [FoodAndDrink]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.FoodAndDrink.stringValue() + CatResourceURI.FindByCriteria.stringValue(),
                parameters: [
                    "themeid"  : themeID,
                    "countyid" : countyID,
                    "latitude" : latitude,
                    "longitude": longitude,
                    "offset"   : offset,
                    "count"    : count
                ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of food & drink venues within a the specified geofence
     */
    func getFoodAndDrinkInGeofence(
        latitude: Float,
        longitude: Float,
        distance: Int,
        completionBlock:((NSError?, [FoodAndDrink]?)->())?) {
        
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.FoodAndDrink.stringValue() + CatResourceURI.FindByNearBy.stringValue(),
                parameters: [
                    "latitude" : latitude,
                    "longitude": longitude,
                    "distance" : distance
                ],
                completionBlock: completionBlock)
    }
    
    /**
     * Gets a list of food & drink venues as specified by rank
     */
    func getFoodAndDrinkByRank(
        rank: Int,
        completionBlock:((NSError?, [FoodAndDrink]?)->())?) {
            
            execRequest(
                NetworkManager.RequestMethod.GET,
                resource: TypeResourceURI.FoodAndDrink.stringValue() + CatResourceURI.FindByRank.stringValue(),
                parameters: [ "rank" : rank ],
                completionBlock: completionBlock)
    }
    
    
    /**
     * Type resource URI to append to path
     */
    private enum TypeResourceURI : String {
        
        case County       = "county/"
        case Theme        = "theme/"
        case Activity     = "activity/"
        case Attraction   = "attraction/"
        case Tour         = "tour/"
        case FoodAndDrink = "foodanddrink/"
        
        func stringValue() -> String {
            return self.rawValue
        }
    }
    
    /**
     * Category resource URI to append to path
     */
    private enum CatResourceURI : String {
        
        case FindTopTen       = "findTopTen"
        case FindByCounty     = "findByCounty"
        case FindByTheme      = "findByTheme"
        case FindByCriteria   = "findByCriteria"
        case FindByNearBy     = "findByNearBy"
        case FindByRank       = "findByRank"
        case FindByDate       = "findByDate"
        case FindByAttraction = "findByAttraction"
        
        func stringValue() -> String {
            return self.rawValue
        }
    }
    
    
    /**
     * Language support
     */
    enum SupportedLanguage : String {
        
        case zh_tw = "zh_tw"
        case en_us = "en_us"
        case ja_jp = "ja_jp"
        
        func stringValue() -> String {
            return self.rawValue;
        }
    }
    
    var supportedLanguage : SupportedLanguage? {
        get {
            if let supportedLanguage = self.networkManager.supportedLanguage {
                return SupportedLanguage(rawValue: supportedLanguage)
            }
            return nil
        }
        set(language) {
            self.networkManager.supportedLanguage = language?.stringValue()
        }
    }
    
    
    /**
     * Private wrapper for request execution
     */
    private func execRequest<T: AnyObject>(
        method: NetworkManager.RequestMethod,
        resource: String,
        parameters: AnyObject?,
        completionBlock:((NSError?, T?)->())?) {
            
            unowned let unownedSelf = self
            networkManager.performRequestWithMethod(
                method,
                resource: resource,
                parameters: parameters,
                completion: { (error: NSError?, responseObject: AnyObject?)->() in
                    unownedSelf.handleResponse(error, responseObject: responseObject, completionBlock: completionBlock)
            })
    }
    
    private func execRequest<T: AnyObject>(
        method: NetworkManager.RequestMethod,
        resource: String,
        parameters: AnyObject?,
        completionBlock:((NSError?, [T]?)->())?) {
            
            unowned let unownedSelf = self
            networkManager.performRequestWithMethod(
                method,
                resource: resource,
                parameters: parameters,
                completion: { (error: NSError?, responseObject: AnyObject?)->() in
                    unownedSelf.handleResponse(error, responseObject: responseObject, completionBlock: completionBlock)
            })
    }
    
    /**
     * Response handler
     */
    private func handleResponse<T: AnyObject>(
        error: NSError?,
        responseObject: AnyObject?,
        completionBlock:((NSError?, T?)->())?) {
            
            if let completion = completionBlock {
                if error == nil {
                    completion(nil, DataParser.parseResponseObject(responseObject) as T?)
                } else {
                    completion(error, nil)
                }
            }
    }
    
    private func handleResponse<T: AnyObject>(
        error: NSError?,
        responseObject: AnyObject?,
        completionBlock:((NSError?, [T]?)->())?) {
            
            if let completion = completionBlock {
                if error == nil {
                    completion(nil, DataParser.parseResponseObjectAsArray(responseObject) as [T]?)
                } else {
                    completion(error, nil)
                }
            }
    }
    
}
