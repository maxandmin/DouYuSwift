//
//  RecTopRoom.h
//
//  Created by xin ma on 15/12/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecTopRoom : NSObject <NSCoding, NSCopying>

@property (nonatomic, assign) double isHighGame;
@property (nonatomic, strong) NSString *specificStatus;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, strong) NSString *roomSrc;
@property (nonatomic, strong) NSString *ownerAvatar;
@property (nonatomic, strong) NSString *showDetails;
@property (nonatomic, strong) NSString *roomName;
@property (nonatomic, strong) NSString *specificCatalog;
@property (nonatomic, strong) NSString *gameName;
@property (nonatomic, strong) NSString *showTime;
@property (nonatomic, strong) NSString *gameUrl;
@property (nonatomic, strong) NSString *showStatus;
@property (nonatomic, strong) NSString *ownerWeight;
@property (nonatomic, strong) NSString *fans;
@property (nonatomic, strong) NSString *roomId;
@property (nonatomic, strong) NSString *ownerUid;
@property (nonatomic, strong) NSString *vodQuality;
@property (nonatomic, assign) double online;
@property (nonatomic, strong) NSString *cateId;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
