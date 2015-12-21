//
//  Attraction.h
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/18/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Attraction : JSONModel

@property (nonatomic, strong) NSString<Optional> *attractionID;
@property (nonatomic, strong) NSArray<Optional> *themes;
@property (nonatomic, strong) NSString<Optional> *desc;
@property (nonatomic, strong) NSArray<Optional> *pictures;
@property (nonatomic, strong) NSArray<Optional> *videos;
@property (nonatomic, strong) NSObject<Optional> *location;
@property (nonatomic, strong) NSArray<Optional> *tels;
@property (nonatomic, strong) NSString<Optional> *address;
@property (nonatomic, strong) NSNumber<Optional> *avgrank;
@property (nonatomic, strong) NSString<Optional> *parking;
@property (nonatomic, strong) NSNumber<Optional> *price;
@property (nonatomic, strong) NSString<Optional> *note;
@property (nonatomic, strong) NSString<Optional> *website;
@property (nonatomic, strong) NSString<Optional> *transport;
@property (nonatomic, strong) NSString<Optional> *county;
@property (nonatomic, strong) NSNumber<Optional> *collection;
@property (nonatomic, strong) NSString<Optional> *shareUrl;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *opentime;

@end
