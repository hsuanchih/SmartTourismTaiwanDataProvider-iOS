//
//  RedirectItem.m
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import "RedirectItem.h"

@implementation RedirectItem

+ (JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"name"         : @"name",
                                                       @"description"  : @"desc",
                                                       @"platformList" : @"platformList"
                                                       }];
}

@end
