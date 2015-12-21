//
//  LiveData.m
//
//  Created by   on 15/12/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "LiveData.h"


NSString *const kLiveDataSubject = @"subject";
NSString *const kLiveDataRoomId = @"room_id";
NSString *const kLiveDataRoomSrc = @"room_src";
NSString *const kLiveDataOwnerUid = @"owner_uid";
NSString *const kLiveDataCateId = @"cate_id";
NSString *const kLiveDataSpecificCatalog = @"specific_catalog";
NSString *const kLiveDataRoomName = @"room_name";
NSString *const kLiveDataShowTime = @"show_time";
NSString *const kLiveDataShowStatus = @"show_status";
NSString *const kLiveDataUrl = @"url";
NSString *const kLiveDataGameUrl = @"game_url";
NSString *const kLiveDataSpecificStatus = @"specific_status";
NSString *const kLiveDataFans = @"fans";
NSString *const kLiveDataNickname = @"nickname";
NSString *const kLiveDataOnline = @"online";
NSString *const kLiveDataGameName = @"game_name";
NSString *const kLiveDataVodQuality = @"vod_quality";


@interface LiveData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LiveData

@synthesize subject = _subject;
@synthesize roomId = _roomId;
@synthesize roomSrc = _roomSrc;
@synthesize ownerUid = _ownerUid;
@synthesize cateId = _cateId;
@synthesize specificCatalog = _specificCatalog;
@synthesize roomName = _roomName;
@synthesize showTime = _showTime;
@synthesize showStatus = _showStatus;
@synthesize url = _url;
@synthesize gameUrl = _gameUrl;
@synthesize specificStatus = _specificStatus;
@synthesize fans = _fans;
@synthesize nickname = _nickname;
@synthesize online = _online;
@synthesize gameName = _gameName;
@synthesize vodQuality = _vodQuality;


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
            self.subject = [self objectOrNilForKey:kLiveDataSubject fromDictionary:dict];
            self.roomId = [self objectOrNilForKey:kLiveDataRoomId fromDictionary:dict];
            self.roomSrc = [self objectOrNilForKey:kLiveDataRoomSrc fromDictionary:dict];
            self.ownerUid = [self objectOrNilForKey:kLiveDataOwnerUid fromDictionary:dict];
            self.cateId = [self objectOrNilForKey:kLiveDataCateId fromDictionary:dict];
            self.specificCatalog = [self objectOrNilForKey:kLiveDataSpecificCatalog fromDictionary:dict];
            self.roomName = [self objectOrNilForKey:kLiveDataRoomName fromDictionary:dict];
            self.showTime = [self objectOrNilForKey:kLiveDataShowTime fromDictionary:dict];
            self.showStatus = [self objectOrNilForKey:kLiveDataShowStatus fromDictionary:dict];
            self.url = [self objectOrNilForKey:kLiveDataUrl fromDictionary:dict];
            self.gameUrl = [self objectOrNilForKey:kLiveDataGameUrl fromDictionary:dict];
            self.specificStatus = [self objectOrNilForKey:kLiveDataSpecificStatus fromDictionary:dict];
            self.fans = [self objectOrNilForKey:kLiveDataFans fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kLiveDataNickname fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kLiveDataOnline fromDictionary:dict] doubleValue];
            self.gameName = [self objectOrNilForKey:kLiveDataGameName fromDictionary:dict];
            self.vodQuality = [self objectOrNilForKey:kLiveDataVodQuality fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.subject forKey:kLiveDataSubject];
    [mutableDict setValue:self.roomId forKey:kLiveDataRoomId];
    [mutableDict setValue:self.roomSrc forKey:kLiveDataRoomSrc];
    [mutableDict setValue:self.ownerUid forKey:kLiveDataOwnerUid];
    [mutableDict setValue:self.cateId forKey:kLiveDataCateId];
    [mutableDict setValue:self.specificCatalog forKey:kLiveDataSpecificCatalog];
    [mutableDict setValue:self.roomName forKey:kLiveDataRoomName];
    [mutableDict setValue:self.showTime forKey:kLiveDataShowTime];
    [mutableDict setValue:self.showStatus forKey:kLiveDataShowStatus];
    [mutableDict setValue:self.url forKey:kLiveDataUrl];
    [mutableDict setValue:self.gameUrl forKey:kLiveDataGameUrl];
    [mutableDict setValue:self.specificStatus forKey:kLiveDataSpecificStatus];
    [mutableDict setValue:self.fans forKey:kLiveDataFans];
    [mutableDict setValue:self.nickname forKey:kLiveDataNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kLiveDataOnline];
    [mutableDict setValue:self.gameName forKey:kLiveDataGameName];
    [mutableDict setValue:self.vodQuality forKey:kLiveDataVodQuality];

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

    self.subject = [aDecoder decodeObjectForKey:kLiveDataSubject];
    self.roomId = [aDecoder decodeObjectForKey:kLiveDataRoomId];
    self.roomSrc = [aDecoder decodeObjectForKey:kLiveDataRoomSrc];
    self.ownerUid = [aDecoder decodeObjectForKey:kLiveDataOwnerUid];
    self.cateId = [aDecoder decodeObjectForKey:kLiveDataCateId];
    self.specificCatalog = [aDecoder decodeObjectForKey:kLiveDataSpecificCatalog];
    self.roomName = [aDecoder decodeObjectForKey:kLiveDataRoomName];
    self.showTime = [aDecoder decodeObjectForKey:kLiveDataShowTime];
    self.showStatus = [aDecoder decodeObjectForKey:kLiveDataShowStatus];
    self.url = [aDecoder decodeObjectForKey:kLiveDataUrl];
    self.gameUrl = [aDecoder decodeObjectForKey:kLiveDataGameUrl];
    self.specificStatus = [aDecoder decodeObjectForKey:kLiveDataSpecificStatus];
    self.fans = [aDecoder decodeObjectForKey:kLiveDataFans];
    self.nickname = [aDecoder decodeObjectForKey:kLiveDataNickname];
    self.online = [aDecoder decodeDoubleForKey:kLiveDataOnline];
    self.gameName = [aDecoder decodeObjectForKey:kLiveDataGameName];
    self.vodQuality = [aDecoder decodeObjectForKey:kLiveDataVodQuality];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_subject forKey:kLiveDataSubject];
    [aCoder encodeObject:_roomId forKey:kLiveDataRoomId];
    [aCoder encodeObject:_roomSrc forKey:kLiveDataRoomSrc];
    [aCoder encodeObject:_ownerUid forKey:kLiveDataOwnerUid];
    [aCoder encodeObject:_cateId forKey:kLiveDataCateId];
    [aCoder encodeObject:_specificCatalog forKey:kLiveDataSpecificCatalog];
    [aCoder encodeObject:_roomName forKey:kLiveDataRoomName];
    [aCoder encodeObject:_showTime forKey:kLiveDataShowTime];
    [aCoder encodeObject:_showStatus forKey:kLiveDataShowStatus];
    [aCoder encodeObject:_url forKey:kLiveDataUrl];
    [aCoder encodeObject:_gameUrl forKey:kLiveDataGameUrl];
    [aCoder encodeObject:_specificStatus forKey:kLiveDataSpecificStatus];
    [aCoder encodeObject:_fans forKey:kLiveDataFans];
    [aCoder encodeObject:_nickname forKey:kLiveDataNickname];
    [aCoder encodeDouble:_online forKey:kLiveDataOnline];
    [aCoder encodeObject:_gameName forKey:kLiveDataGameName];
    [aCoder encodeObject:_vodQuality forKey:kLiveDataVodQuality];
}

- (id)copyWithZone:(NSZone *)zone
{
    LiveData *copy = [[LiveData alloc] init];
    
    if (copy) {

        copy.subject = [self.subject copyWithZone:zone];
        copy.roomId = [self.roomId copyWithZone:zone];
        copy.roomSrc = [self.roomSrc copyWithZone:zone];
        copy.ownerUid = [self.ownerUid copyWithZone:zone];
        copy.cateId = [self.cateId copyWithZone:zone];
        copy.specificCatalog = [self.specificCatalog copyWithZone:zone];
        copy.roomName = [self.roomName copyWithZone:zone];
        copy.showTime = [self.showTime copyWithZone:zone];
        copy.showStatus = [self.showStatus copyWithZone:zone];
        copy.url = [self.url copyWithZone:zone];
        copy.gameUrl = [self.gameUrl copyWithZone:zone];
        copy.specificStatus = [self.specificStatus copyWithZone:zone];
        copy.fans = [self.fans copyWithZone:zone];
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.online = self.online;
        copy.gameName = [self.gameName copyWithZone:zone];
        copy.vodQuality = [self.vodQuality copyWithZone:zone];
    }
    
    return copy;
}


@end
