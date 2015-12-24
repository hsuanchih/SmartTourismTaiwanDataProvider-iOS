//
//  PictureMeta.h
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface PictureMeta : JSONModel

@property (nonatomic, strong) NSString<Optional> *url;
@property (nonatomic, strong) NSNumber<Optional> *width;
@property (nonatomic, strong) NSNumber<Optional> *height;

@end
