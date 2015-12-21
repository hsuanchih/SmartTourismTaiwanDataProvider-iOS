//
//  Tour.m
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/18/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import "Tour.h"

@implementation Tour

+ (JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id"                : @"tourID",
                                                       @"name"              : @"name",
                                                       @"description"       : @"desc",
                                                       @"themes"            : @"themes",
                                                       @"pictures"          : @"pictures",
                                                       @"shareUrl"          : @"shareUrl",
                                                       @"multidayrelatedid" : @"multidayrelatedid",
                                                       @"relatedid"         : @"relatedid",
                                                       @"collection"        : @"collection"
                                                       }];
}

@end
