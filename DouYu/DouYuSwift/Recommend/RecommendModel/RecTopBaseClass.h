//
//  RecTopBaseClass.h
//
//  Created by xin ma on 15/12/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecTopBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double error;
@property (nonatomic, strong) NSArray *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
