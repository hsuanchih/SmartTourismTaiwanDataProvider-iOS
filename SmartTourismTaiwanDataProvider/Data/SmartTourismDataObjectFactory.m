//
//  SmartTourismDataObjectFactory.m
//  SmartTourism
//
//  Created by Hsuan-Chih Chuang on 12/23/15.
//  Copyright © 2015 Chiegaia. All rights reserved.
//

#import "SmartTourismDataObjectFactory.h"
#import "JSONModel.h"

@implementation SmartTourismDataObjectFactory

+(id) createObjectForClass:(Class)class withData:(NSDictionary*)data andError:(NSError*)error {
    
    if ([class isSubclassOfClass:JSONModel.class]) {
        id object = [[class alloc] initWithDictionary:data error:&error];
        if (error == nil) {
            return object;
        }
    }
    return nil;
}

+(id) createObjectArrayForClass:(Class)class withArray:(NSArray*)array andError:(NSError*)error {
    
    if ([class isSubclassOfClass:JSONModel.class]) {
        id object = [class arrayOfModelsFromDictionaries:array error:&error];
        if (error == nil) {
            return object;
        }
    }
    return nil;
}

@end
