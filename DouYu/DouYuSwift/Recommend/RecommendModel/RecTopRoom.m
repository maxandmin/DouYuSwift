//
//  RecTopRoom.m
//
//  Created by xin ma on 15/12/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecTopRoom.h"


NSString *const kRecTopRoomIsHighGame = @"is_high_game";
NSString *const kRecTopRoomSpecificStatus = @"specific_status";
NSString *const kRecTopRoomUrl = @"url";
NSString *const kRecTopRoomNickname = @"nickname";
NSString *const kRecTopRoomRoomSrc = @"room_src";
NSString *const kRecTopRoomOwnerAvatar = @"owner_avatar";
NSString *const kRecTopRoomShowDetails = @"show_details";
NSString *const kRecTopRoomRoomName = @"room_name";
NSString *const kRecTopRoomSpecificCatalog = @"specific_catalog";
NSString *const kRecTopRoomGameName = @"game_name";
NSString *const kRecTopRoomShowTime = @"show_time";
NSString *const kRecTopRoomGameUrl = @"game_url";
NSString *const kRecTopRoomShowStatus = @"show_status";
NSString *const kRecTopRoomOwnerWeight = @"owner_weight";
NSString *const kRecTopRoomFans = @"fans";
NSString *const kRecTopRoomRoomId = @"room_id";
NSString *const kRecTopRoomOwnerUid = @"owner_uid";
NSString *const kRecTopRoomVodQuality = @"vod_quality";
NSString *const kRecTopRoomOnline = @"online";
NSString *const kRecTopRoomCateId = @"cate_id";


@interface RecTopRoom ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecTopRoom

@synthesize isHighGame = _isHighGame;
@synthesize specificStatus = _specificStatus;
@synthesize url = _url;
@synthesize nickname = _nickname;
@synthesize roomSrc = _roomSrc;
@synthesize ownerAvatar = _ownerAvatar;
@synthesize showDetails = _showDetails;
@synthesize roomName = _roomName;
@synthesize specificCatalog = _specificCatalog;
@synthesize gameName = _gameName;
@synthesize showTime = _showTime;
@synthesize gameUrl = _gameUrl;
@synthesize showStatus = _showStatus;
@synthesize ownerWeight = _ownerWeight;
@synthesize fans = _fans;
@synthesize roomId = _roomId;
@synthesize ownerUid = _ownerUid;
@synthesize vodQuality = _vodQuality;
@synthesize online = _online;
@synthesize cateId = _cateId;


+ (instancetype)modelObjectWithDictionary:(NSDictionary *)dict
{
    return [[self alloc] initWithDictionary:dict];
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    
    // This check serves to make sure that a non-NSDictionary object
    // passed into the model class doesn't break the parsing.
    if(self && [dict isKindOfClass:[NSDictionary class]]) {
            self.isHighGame = [[self objectOrNilForKey:kRecTopRoomIsHighGame fromDictionary:dict] doubleValue];
            self.specificStatus = [self objectOrNilForKey:kRecTopRoomSpecificStatus fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRecTopRoomUrl fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kRecTopRoomNickname fromDictionary:dict];
            self.roomSrc = [self objectOrNilForKey:kRecTopRoomRoomSrc fromDictionary:dict];
            self.ownerAvatar = [self objectOrNilForKey:kRecTopRoomOwnerAvatar fromDictionary:dict];
            self.showDetails = [self objectOrNilForKey:kRecTopRoomShowDetails fromDictionary:dict];
            self.roomName = [self objectOrNilForKey:kRecTopRoomRoomName fromDictionary:dict];
            self.specificCatalog = [self objectOrNilForKey:kRecTopRoomSpecificCatalog fromDictionary:dict];
            self.gameName = [self objectOrNilForKey:kRecTopRoomGameName fromDictionary:dict];
            self.showTime = [self objectOrNilForKey:kRecTopRoomShowTime fromDictionary:dict];
            self.gameUrl = [self objectOrNilForKey:kRecTopRoomGameUrl fromDictionary:dict];
            self.showStatus = [self objectOrNilForKey:kRecTopRoomShowStatus fromDictionary:dict];
            self.ownerWeight = [self objectOrNilForKey:kRecTopRoomOwnerWeight fromDictionary:dict];
            self.fans = [self objectOrNilForKey:kRecTopRoomFans fromDictionary:dict];
            self.roomId = [self objectOrNilForKey:kRecTopRoomRoomId fromDictionary:dict];
            self.ownerUid = [self objectOrNilForKey:kRecTopRoomOwnerUid fromDictionary:dict];
            self.vodQuality = [self objectOrNilForKey:kRecTopRoomVodQuality fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kRecTopRoomOnline fromDictionary:dict] doubleValue];
            self.cateId = [self objectOrNilForKey:kRecTopRoomCateId fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.isHighGame] forKey:kRecTopRoomIsHighGame];
    [mutableDict setValue:self.specificStatus forKey:kRecTopRoomSpecificStatus];
    [mutableDict setValue:self.url forKey:kRecTopRoomUrl];
    [mutableDict setValue:self.nickname forKey:kRecTopRoomNickname];
    [mutableDict setValue:self.roomSrc forKey:kRecTopRoomRoomSrc];
    [mutableDict setValue:self.ownerAvatar forKey:kRecTopRoomOwnerAvatar];
    [mutableDict setValue:self.showDetails forKey:kRecTopRoomShowDetails];
    [mutableDict setValue:self.roomName forKey:kRecTopRoomRoomName];
    [mutableDict setValue:self.specificCatalog forKey:kRecTopRoomSpecificCatalog];
    [mutableDict setValue:self.gameName forKey:kRecTopRoomGameName];
    [mutableDict setValue:self.showTime forKey:kRecTopRoomShowTime];
    [mutableDict setValue:self.gameUrl forKey:kRecTopRoomGameUrl];
    [mutableDict setValue:self.showStatus forKey:kRecTopRoomShowStatus];
    [mutableDict setValue:self.ownerWeight forKey:kRecTopRoomOwnerWeight];
    [mutableDict setValue:self.fans forKey:kRecTopRoomFans];
    [mutableDict setValue:self.roomId forKey:kRecTopRoomRoomId];
    [mutableDict setValue:self.ownerUid forKey:kRecTopRoomOwnerUid];
    [mutableDict setValue:self.vodQuality forKey:kRecTopRoomVodQuality];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kRecTopRoomOnline];
    [mutableDict setValue:self.cateId forKey:kRecTopRoomCateId];

    return [NSDictionary dictionaryWithDictionary:mutableDict];
}

- (NSString *)description 
{
    return [NSString stringWithFormat:@"%@", [self dictionaryRepresentation]];
}

#pragma mark - Helper Method
- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict
{
    id object = [dict objectForKey:aKey];
    return [object isEqual:[NSNull null]] ? nil : object;
}


#pragma mark - NSCoding Methods

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];

    self.isHighGame = [aDecoder decodeDoubleForKey:kRecTopRoomIsHighGame];
    self.specificStatus = [aDecoder decodeObjectForKey:kRecTopRoomSpecificStatus];
    self.url = [aDecoder decodeObjectForKey:kRecTopRoomUrl];
    self.nickname = [aDecoder decodeObjectForKey:kRecTopRoomNickname];
    self.roomSrc = [aDecoder decodeObjectForKey:kRecTopRoomRoomSrc];
    self.ownerAvatar = [aDecoder decodeObjectForKey:kRecTopRoomOwnerAvatar];
    self.showDetails = [aDecoder decodeObjectForKey:kRecTopRoomShowDetails];
    self.roomName = [aDecoder decodeObjectForKey:kRecTopRoomRoomName];
    self.specificCatalog = [aDecoder decodeObjectForKey:kRecTopRoomSpecificCatalog];
    self.gameName = [aDecoder decodeObjectForKey:kRecTopRoomGameName];
    self.showTime = [aDecoder decodeObjectForKey:kRecTopRoomShowTime];
    self.gameUrl = [aDecoder decodeObjectForKey:kRecTopRoomGameUrl];
    self.showStatus = [aDecoder decodeObjectForKey:kRecTopRoomShowStatus];
    self.ownerWeight = [aDecoder decodeObjectForKey:kRecTopRoomOwnerWeight];
    self.fans = [aDecoder decodeObjectForKey:kRecTopRoomFans];
    self.roomId = [aDecoder decodeObjectForKey:kRecTopRoomRoomId];
    self.ownerUid = [aDecoder decodeObjectForKey:kRecTopRoomOwnerUid];
    self.vodQuality = [aDecoder decodeObjectForKey:kRecTopRoomVodQuality];
    self.online = [aDecoder decodeDoubleForKey:kRecTopRoomOnline];
    self.cateId = [aDecoder decodeObjectForKey:kRecTopRoomCateId];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_isHighGame forKey:kRecTopRoomIsHighGame];
    [aCoder encodeObject:_specificStatus forKey:kRecTopRoomSpecificStatus];
    [aCoder encodeObject:_url forKey:kRecTopRoomUrl];
    [aCoder encodeObject:_nickname forKey:kRecTopRoomNickname];
    [aCoder encodeObject:_roomSrc forKey:kRecTopRoomRoomSrc];
    [aCoder encodeObject:_ownerAvatar forKey:kRecTopRoomOwnerAvatar];
    [aCoder encodeObject:_showDetails forKey:kRecTopRoomShowDetails];
    [aCoder encodeObject:_roomName forKey:kRecTopRoomRoomName];
    [aCoder encodeObject:_specificCatalog forKey:kRecTopRoomSpecificCatalog];
    [aCoder encodeObject:_gameName forKey:kRecTopRoomGameName];
    [aCoder encodeObject:_showTime forKey:kRecTopRoomShowTime];
    [aCoder encodeObject:_gameUrl forKey:kRecTopRoomGameUrl];
    [aCoder encodeObject:_showStatus forKey:kRecTopRoomShowStatus];
    [aCoder encodeObject:_ownerWeight forKey:kRecTopRoomOwnerWeight];
    [aCoder encodeObject:_fans forKey:kRecTopRoomFans];
    [aCoder encodeObject:_roomId forKey:kRecTopRoomRoomId];
    [aCoder encodeObject:_ownerUid forKey:kRecTopRoomOwnerUid];
    [aCoder encodeObject:_vodQuality forKey:kRecTopRoomVodQuality];
    [aCoder encodeDouble:_online forKey:kRecTopRoomOnline];
    [aCoder encodeObject:_cateId forKey:kRecTopRoomCateId];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecTopRoom *copy = [[RecTopRoom alloc] init];
    
    if (copy) {

        copy.isHighGame = self.isHighGame;
        copy.specificStatus = [self.specificStatus copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.roomSrc = [self.roomSrc copyWithZone:zone];
        copy.ownerAvatar = [self.ownerAvatar copyWithZone:zone];
        copy.showDetails = [self.showDetails copyWithZone:zone];
        copy.roomName = [self.roomName copyWithZone:zone];
        copy.specificCatalog = [self.specificCatalog copyWithZone:zone];
        copy.gameName = [self.gameName copyWithZone:zone];
        copy.showTime = [self.showTime copyWithZone:zone];
        copy.gameUrl = [self.gameUrl copyWithZone:zone];
        copy.showStatus = [self.showStatus copyWithZone:zone];
        copy.ownerWeight = [self.ownerWeight copyWithZone:zone];
        copy.fans = [self.fans copyWithZone:zone];
        copy.roomId = [self.roomId copyWithZone:zone];
        copy.ownerUid = [self.ownerUid copyWithZone:zone];
        copy.vodQuality = [self.vodQuality copyWithZone:zone];
        copy.online = self.online;
        copy.cateId = [self.cateId copyWithZone:zone];
    }
    
    return copy;
}


@end
