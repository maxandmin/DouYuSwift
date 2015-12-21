//
//  ProgramaBaseClass.h
//
//  Created by   on 15/12/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ProgramaBaseClass : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double error;
@property (nonatomic, strong) NSArray *data;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
