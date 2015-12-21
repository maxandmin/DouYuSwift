//
//  RecommendData.m
//
//  Created by xin ma on 15/12/9
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecommendData.h"


NSString *const kRecommendDataSubject = @"subject";
NSString *const kRecommendDataRoomId = @"room_id";
NSString *const kRecommendDataRoomSrc = @"room_src";
NSString *const kRecommendDataOwnerUid = @"owner_uid";
NSString *const kRecommendDataCateId = @"cate_id";
NSString *const kRecommendDataSpecificCatalog = @"specific_catalog";
NSString *const kRecommendDataRoomName = @"room_name";
NSString *const kRecommendDataShowTime = @"show_time";
NSString *const kRecommendDataShowStatus = @"show_status";
NSString *const kRecommendDataUrl = @"url";
NSString *const kRecommendDataGameUrl = @"game_url";
NSString *const kRecommendDataSpecificStatus = @"specific_status";
NSString *const kRecommendDataNickname = @"nickname";
NSString *const kRecommendDataOnline = @"online";
NSString *const kRecommendDataGameName = @"game_name";
NSString *const kRecommendDataVodQuality = @"vod_quality";


@interface RecommendData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendData

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
            self.subject = [self objectOrNilForKey:kRecommendDataSubject fromDictionary:dict];
            self.roomId = [self objectOrNilForKey:kRecommendDataRoomId fromDictionary:dict];
            self.roomSrc = [self objectOrNilForKey:kRecommendDataRoomSrc fromDictionary:dict];
            self.ownerUid = [self objectOrNilForKey:kRecommendDataOwnerUid fromDictionary:dict];
            self.cateId = [self objectOrNilForKey:kRecommendDataCateId fromDictionary:dict];
            self.specificCatalog = [self objectOrNilForKey:kRecommendDataSpecificCatalog fromDictionary:dict];
            self.roomName = [self objectOrNilForKey:kRecommendDataRoomName fromDictionary:dict];
            self.showTime = [self objectOrNilForKey:kRecommendDataShowTime fromDictionary:dict];
            self.showStatus = [self objectOrNilForKey:kRecommendDataShowStatus fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRecommendDataUrl fromDictionary:dict];
            self.gameUrl = [self objectOrNilForKey:kRecommendDataGameUrl fromDictionary:dict];
            self.specificStatus = [self objectOrNilForKey:kRecommendDataSpecificStatus fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kRecommendDataNickname fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kRecommendDataOnline fromDictionary:dict] doubleValue];
            self.gameName = [self objectOrNilForKey:kRecommendDataGameName fromDictionary:dict];
            self.vodQuality = [self objectOrNilForKey:kRecommendDataVodQuality fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.subject forKey:kRecommendDataSubject];
    [mutableDict setValue:self.roomId forKey:kRecommendDataRoomId];
    [mutableDict setValue:self.roomSrc forKey:kRecommendDataRoomSrc];
    [mutableDict setValue:self.ownerUid forKey:kRecommendDataOwnerUid];
    [mutableDict setValue:self.cateId forKey:kRecommendDataCateId];
    [mutableDict setValue:self.specificCatalog forKey:kRecommendDataSpecificCatalog];
    [mutableDict setValue:self.roomName forKey:kRecommendDataRoomName];
    [mutableDict setValue:self.showTime forKey:kRecommendDataShowTime];
    [mutableDict setValue:self.showStatus forKey:kRecommendDataShowStatus];
    [mutableDict setValue:self.url forKey:kRecommendDataUrl];
    [mutableDict setValue:self.gameUrl forKey:kRecommendDataGameUrl];
    [mutableDict setValue:self.specificStatus forKey:kRecommendDataSpecificStatus];
    [mutableDict setValue:self.nickname forKey:kRecommendDataNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kRecommendDataOnline];
    [mutableDict setValue:self.gameName forKey:kRecommendDataGameName];
    [mutableDict setValue:self.vodQuality forKey:kRecommendDataVodQuality];

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

    self.subject = [aDecoder decodeObjectForKey:kRecommendDataSubject];
    self.roomId = [aDecoder decodeObjectForKey:kRecommendDataRoomId];
    self.roomSrc = [aDecoder decodeObjectForKey:kRecommendDataRoomSrc];
    self.ownerUid = [aDecoder decodeObjectForKey:kRecommendDataOwnerUid];
    self.cateId = [aDecoder decodeObjectForKey:kRecommendDataCateId];
    self.specificCatalog = [aDecoder decodeObjectForKey:kRecommendDataSpecificCatalog];
    self.roomName = [aDecoder decodeObjectForKey:kRecommendDataRoomName];
    self.showTime = [aDecoder decodeObjectForKey:kRecommendDataShowTime];
    self.showStatus = [aDecoder decodeObjectForKey:kRecommendDataShowStatus];
    self.url = [aDecoder decodeObjectForKey:kRecommendDataUrl];
    self.gameUrl = [aDecoder decodeObjectForKey:kRecommendDataGameUrl];
    self.specificStatus = [aDecoder decodeObjectForKey:kRecommendDataSpecificStatus];
    self.nickname = [aDecoder decodeObjectForKey:kRecommendDataNickname];
    self.online = [aDecoder decodeDoubleForKey:kRecommendDataOnline];
    self.gameName = [aDecoder decodeObjectForKey:kRecommendDataGameName];
    self.vodQuality = [aDecoder decodeObjectForKey:kRecommendDataVodQuality];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_subject forKey:kRecommendDataSubject];
    [aCoder encodeObject:_roomId forKey:kRecommendDataRoomId];
    [aCoder encodeObject:_roomSrc forKey:kRecommendDataRoomSrc];
    [aCoder encodeObject:_ownerUid forKey:kRecommendDataOwnerUid];
    [aCoder encodeObject:_cateId forKey:kRecommendDataCateId];
    [aCoder encodeObject:_specificCatalog forKey:kRecommendDataSpecificCatalog];
    [aCoder encodeObject:_roomName forKey:kRecommendDataRoomName];
    [aCoder encodeObject:_showTime forKey:kRecommendDataShowTime];
    [aCoder encodeObject:_showStatus forKey:kRecommendDataShowStatus];
    [aCoder encodeObject:_url forKey:kRecommendDataUrl];
    [aCoder encodeObject:_gameUrl forKey:kRecommendDataGameUrl];
    [aCoder encodeObject:_specificStatus forKey:kRecommendDataSpecificStatus];
    [aCoder encodeObject:_nickname forKey:kRecommendDataNickname];
    [aCoder encodeDouble:_online forKey:kRecommendDataOnline];
    [aCoder encodeObject:_gameName forKey:kRecommendDataGameName];
    [aCoder encodeObject:_vodQuality forKey:kRecommendDataVodQuality];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendData *copy = [[RecommendData alloc] init];
    
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
        copy.nickname = [self.nickname copyWithZone:zone];
        copy.online = self.online;
        copy.gameName = [self.gameName copyWithZone:zone];
        copy.vodQuality = [self.vodQuality copyWithZone:zone];
    }
    
    return copy;
}


@end
