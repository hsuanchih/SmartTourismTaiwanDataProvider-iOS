//
//  RedirectItem.h
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/17/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <JSONModel/JSONModel.h>

@interface RedirectItem : JSONModel

@property (nonatomic, strong) NSString<Optional> *name;
@property (nonatomic, strong) NSString<Optional> *desc;
@property (nonatomic, strong) NSArray<Optional> *platformList;

@end
