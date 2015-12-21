//
//  Attraction.m
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/18/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import "Attraction.h"

@implementation Attraction

+ (JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id"           : @"attractionID",
                                                       @"address"      : @"address",
                                                       @"description"  : @"desc",
                                                       @"avgrank"      : @"avgrank",
                                                       @"collection"   : @"collection",
                                                       @"county"       : @"county",
                                                       @"price"        : @"price",
                                                       @"opentime"     : @"opentime",
                                                       @"note"         : @"note",
                                                       @"parking"      : @"parking",
                                                       @"pictures"     : @"pictures",
                                                       @"location"     : @"location",
                                                       @"tels"         : @"tels",
                                                       @"transport"    : @"transport",
                                                       @"videos"       : @"videos",
                                                       @"website"      : @"website",
                                                       @"themes"       : @"themes",
                                                       @"shareUrl"     : @"shareUrl",
                                                       @"name"         : @"name"
                                                       }];
}

@end
