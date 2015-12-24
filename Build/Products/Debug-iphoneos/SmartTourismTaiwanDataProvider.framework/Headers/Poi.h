//
//  Poi.h
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Poi : JSONModel

@property (nonatomic, strong) NSString<Optional> *poiID;
@property (nonatomic, strong) NSString<Optional> *type;
@property (nonatomic, strong) id<Optional> detail;

@end
