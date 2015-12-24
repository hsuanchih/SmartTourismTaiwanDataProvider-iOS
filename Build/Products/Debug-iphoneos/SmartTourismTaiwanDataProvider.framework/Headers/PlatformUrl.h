//
//  PlatformUrl.h
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface PlatformUrl : JSONModel

@property (nonatomic, strong) id<Optional> platformType;
@property (nonatomic, strong) NSString<Optional> *url;

@end
