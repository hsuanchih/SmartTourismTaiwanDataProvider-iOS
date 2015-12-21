//
//  Activity.m
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import "Activity.h"

@implementation Activity

+ (JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id"           : @"activityID",
                                                       @"address"      : @"address",
                                                       @"description"  : @"desc",
                                                       @"avgrank"      : @"avgrank",
                                                       @"collection"   : @"collection",
                                                       @"county"       : @"county",
                                                       @"currency"     : @"currency",
                                                       @"price"        : @"price",
                                                       @"starttime"    : @"starttime",
                                                       @"endtime"      : @"endtime",
                                                       @"note"         : @"note",
                                                       @"organizer"    : @"organizer",
                                                       @"parking"      : @"parking",
                                                       @"pictures"     : @"pictures",
                                                       @"presenter"    : @"presenter",
                                                       @"location"     : @"location",
                                                       @"registration" : @"registration",
                                                       @"target"       : @"target",
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
