//
//  Theme.h
//  SmartTourismTaiwan
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface Theme : JSONModel

@property (nonatomic, strong) NSString<Optional> *themeID;
@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *desc;
@property (nonatomic, strong) NSArray<Optional> *pictures;
@property (nonatomic, strong) NSArray<Optional> *subthemeList;
@property (nonatomic, strong) NSArray<Optional> *poiList;
@property (nonatomic, strong) NSNumber<Optional> *type;

@end
