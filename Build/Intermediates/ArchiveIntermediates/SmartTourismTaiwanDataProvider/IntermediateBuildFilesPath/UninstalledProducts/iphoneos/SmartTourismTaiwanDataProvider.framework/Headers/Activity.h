//
//  Activity.h
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Activity : JSONModel

@property (nonatomic, strong) NSString<Optional> *activityID;
@property (nonatomic, strong) NSString<Optional> *address;
@property (nonatomic, strong) NSNumber<Optional> *avgrank;
@property (nonatomic, strong) NSNumber<Optional> *collection;
@property (nonatomic, strong) NSString<Optional> *county;
@property (nonatomic, strong) NSString<Optional> *currency;
@property (nonatomic, strong) NSNumber<Optional> *price;
@property (nonatomic, strong) NSString<Optional> *desc;
@property (nonatomic, strong) NSString<Optional> *starttime;
@property (nonatomic, strong) NSString<Optional> *endtime;
@property (nonatomic, strong) NSString<Optional> *note;
@property (nonatomic, strong) NSString<Optional> *organizer;
@property (nonatomic, strong) NSString<Optional> *parking;
@property (nonatomic, strong) NSArray<Optional> *pictures;
@property (nonatomic, strong) NSString<Optional> *presenter;
@property (nonatomic, strong) NSObject<Optional> *location;
@property (nonatomic, strong) NSString<Optional> *registration;
@property (nonatomic, strong) NSString<Optional> *target;
@property (nonatomic, strong) NSArray<Optional> *tels;
@property (nonatomic, strong) NSString<Optional> *transport;
@property (nonatomic, strong) NSArray<Optional> *videos;
@property (nonatomic, strong) NSString<Optional> *website;
@property (nonatomic, strong) NSArray<Optional> *themes;
@property (nonatomic, strong) NSString<Optional> *shareUrl;
@property (nonatomic, strong) NSString<Optional> *name;

@end
