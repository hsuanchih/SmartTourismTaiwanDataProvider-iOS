//
//  County.m
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import "County.h"

@implementation County

+ (JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id"           : @"countyID",
                                                       @"name"         : @"name",
                                                       @"region"       : @"region"
                                                       }];
}

@end
