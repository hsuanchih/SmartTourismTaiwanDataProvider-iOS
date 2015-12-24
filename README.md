# Smart Tourism Taiwan Data Provider (iOS)
The Smart Tourism Taiwan Data Provider is a framework that gives your application access to  
the [Smart Tourism Taiwan Open Data](http://www.hackathon.vztaiwan.com/swagger.html) made available by the [Institute for Information Industry](http://www.iii.org.tw/Default.aspx) .

This iOS framework uses AFNetworking HTTP Client in combination with JSONModel 
under the hood to streamline access to Smart Tourism Taiwan's web services.

## Usage
### Building the framework:
* Build the framework from source in Xcode & add the framework to your project

### Using the library:
* Getting a reference to the data provider:
```Swift
/**
  * Get a reference to the data provider 
  */
let dataProvider = SmartTourismDataProvider.instance
```
* Accessing Smart Tourism Taiwan Open Data (Example):
```Swift
/**
 * Query a list of counties
 */
dataProvider.getCountyList { (error: NSError?, countyList: [County]?) -> () in
      
      /**
       * Handle response data
       */
      if error == nil {
          if let list = countyList {
              for county in list {
              
                  /**
                   * Do some stuff...
                   */
                  print("getCountyList: ", county.countyID, county.name, county.region)
              }
          }
      } else {
      
          /**
           * Follow-up failure case
           */
          print(error?.userInfo)
      }
}
```

* Setting the Language Pack (Optional):
```Swift
/**
 * Set the language pack to English (US)
 */
dataProvider.supportedLanguage = SmartTourismDataProvider.SupportedLanguage.en_us
```


## TODO
#####Intelligent & ACL APIs Pending

## License
#####Licensed under the MIT License.
