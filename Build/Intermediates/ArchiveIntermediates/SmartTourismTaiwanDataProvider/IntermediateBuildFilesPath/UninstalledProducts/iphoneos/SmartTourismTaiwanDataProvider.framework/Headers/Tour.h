//
//  Tour.h
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/18/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Tour : JSONModel

@property (nonatomic, strong) NSNumber<Optional> *collection;
@property (nonatomic, strong) NSArray<Optional> *relatedid;
@property (nonatomic, strong) id<Optional> multidayrelatedid;
@property (nonatomic, strong) NSString<Optional> *shareUrl;
@property (nonatomic, strong) NSArray<Optional> *pictures;
@property (nonatomic, strong) NSArray<Optional> *themes;
@property (nonatomic, strong) NSString<Optional> *desc;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *tourID;

@end
