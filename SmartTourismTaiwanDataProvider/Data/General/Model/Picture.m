//
//  Picture.m
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import "Picture.h"

@implementation Picture

+ (JSONKeyMapper*) keyMapper {
    return [[JSONKeyMapper alloc] initWithDictionary:@{
                                                       @"url"          : @"url",
                                                       @"description"  : @"desc",
                                                       @"metas"        : @"metas"
                                                       }];
}

@end
