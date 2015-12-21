//
//  RecGamelistBaseClass.h
//
//  Created by   on 15/12/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecGamelistBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double error;
@property (nonatomic, strong) NSArray *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
