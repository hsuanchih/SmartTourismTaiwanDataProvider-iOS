//
//  County.h
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface County : JSONModel

@property (nonatomic, strong) NSString<Optional> *countyID;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *region;

@end
