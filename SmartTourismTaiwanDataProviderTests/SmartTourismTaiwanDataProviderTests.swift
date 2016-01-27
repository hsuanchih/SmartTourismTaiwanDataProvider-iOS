//
//  SmartTourismTaiwanDataProviderTests.swift
//  SmartTourismTaiwanDataProviderTests
//
//  Created by Hsuan-Chih Chuang on 12/21/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

import XCTest
import AFNetworking
import Nocilla

@testable import SmartTourismTaiwanDataProvider

class SmartTourismTaiwanDataProviderTests: XCTestCase {
    
    lazy var dataProvider = {
        return SmartTourismDataProvider.instance
    }()
    
    lazy var requestHeader = {
        return [
            "Accept-Language": "zh-Hant-US;q=1, en-US;q=0.9, ja-US;q=0.8",
            "User-Agent": "(null)/(null) (iPhone; iOS 9.2; Scale/2.00)",
            "apiKey": NetworkManager.appKey
        ]
    }()
    
    lazy var responseHeader = {
        return ["Content-Type" : "application/json"]
    }()
    
    lazy var dateFormatter : NSDateFormatter = {
        let df = NSDateFormatter()
        df.dateFormat = "yyyy-MM-dd"
        return df
    }()
    
    override class func setUp() {
        super.setUp()
        LSNocilla.sharedInstance().start()
    }
    
    override class func tearDown() {
        super.tearDown()
        LSNocilla.sharedInstance().stop()
    }
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
        LSNocilla.sharedInstance().clearStubs()
    }
    
    // MARK: URL factory
    func constructUrl(resource : String) -> String {
        let networkManager = dataProvider.networkManager
        return NetworkManager.baseUrl +
            networkManager.smartTourismResourcePrefix +
            resource + "?apikey=" +
            networkManager.apiKey
    }
    
    
    
    // MARK: SmartTourismTaiwanDataProvider Tests
    
    func testGetCountyList() {
        
        // prepare benchmark data
        var countyList = [County]()
        for i in 0..<4 {
            let county = County()
            county.countyID = String(i)
            county.name = "county" + county.countyID
            county.region = "region" + county.countyID
            countyList.append(county)
        }
        let benchmarkData = JSONModel.arrayOfDictionariesFromModels(countyList)
        
        // setup test stub
        setupTestStubWithRequestMethod(
            "GET",
            resource: constructUrl(SmartTourismDataProvider.TypeResourceURI.County.stringValue()),
            requestBody: nil,
            responseBody: benchmarkData)
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getCountyList { (error: NSError?, list: [County]?) -> () in
            
            // validate network response & fulfill expectation
            unownedSelf.validateResponse(testCase, error: error, result: list, benchmarkResponse: benchmarkData as! [County])
            expectation.fulfill()
        }
        
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
        
    }
    
    func testGetThemeByID() {
        
        // prepare benchmark data
        let themeID = "11"
        let benchmark = Theme()
        benchmark.themeID = themeID
        benchmark.name = "Theme"
        benchmark.desc = "Desc"
        
        // setup test stub
        setupTestStubWithRequestMethod(
            "GET",
            resource: constructUrl(SmartTourismDataProvider.TypeResourceURI.Theme.stringValue() + themeID + "/"),
            requestBody: nil,
            responseBody: benchmark.toDictionary())
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getThemeByID(themeID) { (error: NSError?, theme: Theme?) -> () in
            
            // validate network response & fulfill expectation
            unownedSelf.validateResponse(testCase, error: error, result: theme, benchmarkResponse: benchmark.toJSONData())
            expectation.fulfill()
        }
        
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
    }
    
    func testGetActivityByID() {
        
        // prepare benchmark data
        let activityID = "11"
        let benchmark = Activity()
        benchmark.activityID = activityID
        benchmark.name = "Activity"
        benchmark.desc = "Desc"
        
        // setup test stub
        setupTestStubWithRequestMethod(
            "GET",
            resource: constructUrl(SmartTourismDataProvider.TypeResourceURI.Activity.stringValue() + activityID + "/"),
            requestBody: nil,
            responseBody: benchmark.toDictionary())
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getActivityByID(activityID) { (error: NSError?, activity: Activity?) -> () in
            
            // validate network response & fulfill expectation
            unownedSelf.validateResponse(testCase, error: error, result: activity, benchmarkResponse: benchmark.toJSONData())
            expectation.fulfill()
        }
        
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
    }
    
    func testgetTopTenActivities() {
        
        // prepare benchmark data
        let activityList = createActivityList()
        let benchmarkData = JSONModel.arrayOfDictionariesFromModels(activityList)
        
        // setup test stub
        setupTestStubWithRequestMethod(
            "GET",
            resource: constructUrl(SmartTourismDataProvider.TypeResourceURI.Activity.stringValue() +
                SmartTourismDataProvider.CatResourceURI.FindTopTen.stringValue()),
            requestBody: nil,
            responseBody: benchmarkData)
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getTopTenActivities { (error: NSError?, list: [Activity]?) -> () in
            
            // validate network response & fulfill expectation
            unownedSelf.validateResponse(testCase, error: error, result: list, benchmarkResponse: benchmarkData as! [Activity])
            expectation.fulfill()
        }
                
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
    }
    
    func testGetActivitiesByCountyID() {
        
        // prepare benchmark data
        let activityList = createActivityList()
        let benchmarkData = JSONModel.arrayOfDictionariesFromModels(activityList)
        let countyID = "10"
        
        // setup test stub
        setupTestStubWithRequestMethod(
            "GET",
            resource: constructUrl(SmartTourismDataProvider.TypeResourceURI.Activity.stringValue() +
                SmartTourismDataProvider.CatResourceURI.FindByCounty.stringValue()) + "&countyid=" + countyID,
            requestBody: nil,
            responseBody: benchmarkData)
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getActivitiesByCountyID(countyID) { (error: NSError?, list: [Activity]?) -> () in
            
            // validate network response & fulfill expectation
            unownedSelf.validateResponse(testCase, error: error, result: list, benchmarkResponse: benchmarkData as! [Activity])
            expectation.fulfill()
        }
        
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
    }
    
    func testGetActivitiesByThemeID() {
        
        // prepare benchmark data
        let activityList = createActivityList()
        let benchmarkData = JSONModel.arrayOfDictionariesFromModels(activityList)
        let themeID = "10"
        
        // setup test stub
        setupTestStubWithRequestMethod(
            "GET",
            resource: constructUrl(SmartTourismDataProvider.TypeResourceURI.Activity.stringValue() +
                SmartTourismDataProvider.CatResourceURI.FindByTheme.stringValue()) + "&themeid=" + themeID,
            requestBody: nil,
            responseBody: benchmarkData)
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getActivitiesByThemeID(themeID) { (error: NSError?, list: [Activity]?) -> () in
            
            // validate network response & fulfill expectation
            unownedSelf.validateResponse(testCase, error: error, result: list, benchmarkResponse: benchmarkData as! [Activity])
            expectation.fulfill()
        }
        
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
    }
    
    func testGetActivitiesByCriteria() {
        
        // prepare benchmark data
        let activityList = createActivityList()
        let benchmarkData = JSONModel.arrayOfDictionariesFromModels(activityList)
        
        // setup test stub
        let criteria = setupCriteria()
        var resource = constructUrl(SmartTourismDataProvider.TypeResourceURI.Activity.stringValue() +
            SmartTourismDataProvider.CatResourceURI.FindByCriteria.stringValue())
        
        for (key, value) in criteria.sort({ $0.0 < $1.0 })  {
            resource += "&" + key + "=" + value
        }
        setupTestStubWithRequestMethod(
            "GET",
            resource: resource,
            requestBody: nil,
            responseBody: benchmarkData)
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getActivitiesByCriteria(
            criteria["themeid"]!,
            countyID: criteria["countyid"]!,
            latitude: Float(criteria["latitude"]!)!,
            longitude: Float(criteria["longitude"]!)!,
            offset: Int(criteria["offset"]!)!,
            count: Int(criteria["count"]!)!) { (error: NSError?, list: [Activity]?) -> () in
                
                // validate network response & fulfill expectation
                unownedSelf.validateResponse(testCase, error: error, result: list, benchmarkResponse: benchmarkData as! [Activity])
                expectation.fulfill()
        }
        
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
    }
    
    func testGetActivitiesInGeofence() {
        
        // prepare benchmark data
        let activityList = createActivityList()
        let benchmarkData = JSONModel.arrayOfDictionariesFromModels(activityList)
        let latitude : Float = 25.058, longitude : Float = 121.548, distance = 200
        
        // setup test stub
        setupTestStubWithRequestMethod(
            "GET",
            resource: constructUrl(SmartTourismDataProvider.TypeResourceURI.Activity.stringValue() +
                SmartTourismDataProvider.CatResourceURI.FindByNearBy.stringValue()) +
                "&distance=" + String(distance) +
                "&latitude=" + String(latitude) +
                "&longitude=" + String(longitude),
            requestBody: nil,
            responseBody: benchmarkData)
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getActivitiesInGeofence(
            latitude,
            longitude: longitude,
            distance: distance) { (error: NSError?, list: [Activity]?) -> () in
                
                // validate network response & fulfill expectation
                unownedSelf.validateResponse(testCase, error: error, result: list, benchmarkResponse: benchmarkData as! [Activity])
                expectation.fulfill()
        }
        
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
        
    }
    
    func testGetActivitiesByRank() {
        
        // prepare benchmark data
        let activityList = createActivityList()
        let benchmarkData = JSONModel.arrayOfDictionariesFromModels(activityList)
        
        // setup test stub
        let rank = 5
        setupTestStubWithRequestMethod(
            "GET",
            resource: constructUrl(SmartTourismDataProvider.TypeResourceURI.Activity.stringValue() +
                SmartTourismDataProvider.CatResourceURI.FindByRank.stringValue()) +
                "&rank=" + String(rank),
            requestBody: nil,
            responseBody: benchmarkData)
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getActivitiesByRank(rank) { (error: NSError?, list: [Activity]?) -> () in
            
            // validate network response & fulfill expectation
            unownedSelf.validateResponse(testCase, error: error, result: list, benchmarkResponse: benchmarkData as! [Activity])
            expectation.fulfill()
        }
        
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
        
    }
    
    func testGetActivitiesByDate() {
        
        // prepare benchmark data
        let activityList = createActivityList()
        let benchmarkData = JSONModel.arrayOfDictionariesFromModels(activityList)
        
        // setup test stub
        let date = NSDate()
        setupTestStubWithRequestMethod(
            "GET",
            resource: constructUrl(SmartTourismDataProvider.TypeResourceURI.Activity.stringValue() +
                SmartTourismDataProvider.CatResourceURI.FindByDate.stringValue()) +
                "&date=" + dateFormatter.stringFromDate(date),
            requestBody: nil,
            responseBody: benchmarkData)
        
        // form expectation
        let testCase = __FUNCTION__
        let expectation = expectationWithDescription(testCase)
        
        // fire network request
        unowned let unownedSelf = self
        dataProvider.getActivitiesByDate(dateFormatter.stringFromDate(date)) { (error: NSError?, list: [Activity]?) -> () in
            
            // validate network response & fulfill expectation
            unownedSelf.validateResponse(testCase, error: error, result: list, benchmarkResponse: benchmarkData as! [Activity])
            expectation.fulfill()
        }
        
        // wait for expectation timeout
        waitForExpectationsWithTimeout(10.0, handler: { (error: NSError?) -> Void in
            if error != nil {
                XCTFail(testCase + ": Timed-Out")
            }
        })
    }
    
    
    // MARK: Benchmark data factory
    func createActivityList() -> [Activity] {
        
        var activityList = [Activity]()
        for i in 0..<10 {
            let activity = Activity()
            activity.activityID = String(i)
            activity.name = "activity" + activity.activityID
            activity.desc = "desc" + activity.activityID
            activityList.append(activity)
        }
        return activityList
    }
    
    func setupCriteria() -> [String: String] {
        
        return [
            "themeid"  : "10",
            "countyid" : "10",
            "latitude" : "25.058",
            "longitude": "121.548",
            "offset"   : "0",
            "count"    : "10"
        ]
    }
    
    
    // MARK: Test stub factory
    func setupTestStubWithRequestMethod(
        requestMethod: String,
        resource: String,
        requestBody: AnyObject?,
        responseBody: AnyObject)
    {
        do {
            let response = try NSJSONSerialization.dataWithJSONObject(responseBody, options: NSJSONWritingOptions.PrettyPrinted)
            
            if requestBody != nil {
                
                do {
                    let request = try NSJSONSerialization.dataWithJSONObject(requestBody!, options: NSJSONWritingOptions.PrettyPrinted)
                    
                    stubRequest(requestMethod, resource)
                        .withHeaders(requestHeader)
                        .withBody(request)
                        .andReturn(200)
                        .withHeaders(responseHeader)
                        .withBody(response)
                    
                } catch {
                    XCTFail(__FUNCTION__ + ": Invalid Data")
                }
                
            } else {
                
                stubRequest(requestMethod, resource)
                    .withHeaders(requestHeader)
                    .andReturn(200)
                    .withHeaders(responseHeader)
                    .withBody(response)
            }
        } catch {
            XCTFail(__FUNCTION__ + ": Invalid Data")
        }
    }
    
    
    // MARK: Response validator
    func validateResponse<T: JSONModel>(
        testCase: String,
        error: NSError?,
        result: [T]?,
        benchmarkResponse: [T])
    {
        if error == nil {
            if result != nil {
                let actualResponse = JSONModel.arrayOfDictionariesFromModels(result!)
                XCTAssertEqual(benchmarkResponse, actualResponse, testCase + ": Mismatched Response")
            }
        } else {
            XCTFail(testCase + ": Error Response")
        }
    }
    
    func validateResponse(
        testCase: String,
        error: NSError?,
        result: JSONModel?,
        benchmarkResponse: NSData)
    {
        if error == nil {
            if result != nil {
                let actualResponse = result!.toJSONData()
                XCTAssertTrue(benchmarkResponse.isEqualToData(actualResponse), testCase + ": Mismatched Response")
            }
        } else {
            XCTFail(testCase + ": Error Response")
        }
    }
    
    
    /*
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
*/
    
}
