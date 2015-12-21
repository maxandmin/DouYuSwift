//
//  ProgramaData.h
//
//  Created by   on 15/12/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface ProgramaData : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *cateId;
@property (nonatomic, strong) NSString *gameUrl;
@property (nonatomic, strong) NSString *gameName;
@property (nonatomic, strong) NSString *gameIcon;
@property (nonatomic, strong) NSString *gameSrc;
@property (nonatomic, strong) NSString *shortName;
@property (nonatomic, strong) NSString *onlineRoom;
@property (nonatomic, strong) NSString *onlineRoomIos;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
