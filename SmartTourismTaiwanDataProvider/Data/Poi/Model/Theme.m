//
//  Theme.m
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import "Theme.h"

@implementation Theme

+ (JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"id"           : @"themeID",
                                                       @"name"         : @"name",
                                                       @"description"  : @"desc",
                                                       @"pictures"     : @"pictures",
                                                       @"subthemeList" : @"subthemeList",
                                                       @"poiList"      : @"poiList",
                                                       @"type"         : @"type"
                                                        }];
}

@end
