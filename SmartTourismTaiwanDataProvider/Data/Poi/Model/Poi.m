//
//  Poi.m
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import "Poi.h"

@implementation Poi

+ (JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id"           : @"poiID",
                                                       @"type"         : @"type",
                                                       @"detail"       : @"detail"
                                                       }];
}

@end
