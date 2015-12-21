//
//  RecGamelistRoomlist.h
//
//  Created by   on 15/12/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface RecGamelistRoomlist : NSObject <NSCoding, NSCopying>

@property (nonatomic, strong) NSString *subject;
@property (nonatomic, strong) NSString *roomId;
@property (nonatomic, strong) NSString *roomSrc;
@property (nonatomic, strong) NSString *ownerUid;
@property (nonatomic, strong) NSString *cateId;
@property (nonatomic, strong) NSString *specificCatalog;
@property (nonatomic, strong) NSString *roomName;
@property (nonatomic, strong) NSString *showTime;
@property (nonatomic, strong) NSString *showStatus;
@property (nonatomic, strong) NSString *url;
@property (nonatomic, strong) NSString *gameUrl;
@property (nonatomic, strong) NSString *specificStatus;
@property (nonatomic, strong) NSString *nickname;
@property (nonatomic, assign) double online;
@property (nonatomic, strong) NSString *gameName;
@property (nonatomic, strong) NSString *vodQuality;

+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict;
- (instancetype)initWithDictionary:(NSDictionary *)dict;
- (NSDictionary *)dictionaryRepresentation;

@end
