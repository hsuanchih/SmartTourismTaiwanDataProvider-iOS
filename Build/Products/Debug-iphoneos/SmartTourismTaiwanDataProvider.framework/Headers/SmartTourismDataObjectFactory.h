//
//  SmartTourismDataObjectFactory.h
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/23/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SmartTourismDataObjectFactory : NSObject

+(id) createObjectForClass:(Class)class withData:(NSDictionary*)data andError:(NSError*)error;
+(id) createObjectArrayForClass:(Class)class withArray:(NSArray*)array andError:(NSError*)error;

@end
