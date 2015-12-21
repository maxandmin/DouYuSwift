//
//  RecGamelistRoomlist.m
//
//  Created by   on 15/12/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecGamelistRoomlist.h"


NSString *const kRecGamelistRoomlistSubject = @"subject";
NSString *const kRecGamelistRoomlistRoomId = @"room_id";
NSString *const kRecGamelistRoomlistRoomSrc = @"room_src";
NSString *const kRecGamelistRoomlistOwnerUid = @"owner_uid";
NSString *const kRecGamelistRoomlistCateId = @"cate_id";
NSString *const kRecGamelistRoomlistSpecificCatalog = @"specific_catalog";
NSString *const kRecGamelistRoomlistRoomName = @"room_name";
NSString *const kRecGamelistRoomlistShowTime = @"show_time";
NSString *const kRecGamelistRoomlistShowStatus = @"show_status";
NSString *const kRecGamelistRoomlistUrl = @"url";
NSString *const kRecGamelistRoomlistGameUrl = @"game_url";
NSString *const kRecGamelistRoomlistSpecificStatus = @"specific_status";
NSString *const kRecGamelistRoomlistNickname = @"nickname";
NSString *const kRecGamelistRoomlistOnline = @"online";
NSString *const kRecGamelistRoomlistGameName = @"game_name";
NSString *const kRecGamelistRoomlistVodQuality = @"vod_quality";


@interface RecGamelistRoomlist ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecGamelistRoomlist

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
            self.subject = [self objectOrNilForKey:kRecGamelistRoomlistSubject fromDictionary:dict];
            self.roomId = [self objectOrNilForKey:kRecGamelistRoomlistRoomId fromDictionary:dict];
            self.roomSrc = [self objectOrNilForKey:kRecGamelistRoomlistRoomSrc fromDictionary:dict];
            self.ownerUid = [self objectOrNilForKey:kRecGamelistRoomlistOwnerUid fromDictionary:dict];
            self.cateId = [self objectOrNilForKey:kRecGamelistRoomlistCateId fromDictionary:dict];
            self.specificCatalog = [self objectOrNilForKey:kRecGamelistRoomlistSpecificCatalog fromDictionary:dict];
            self.roomName = [self objectOrNilForKey:kRecGamelistRoomlistRoomName fromDictionary:dict];
            self.showTime = [self objectOrNilForKey:kRecGamelistRoomlistShowTime fromDictionary:dict];
            self.showStatus = [self objectOrNilForKey:kRecGamelistRoomlistShowStatus fromDictionary:dict];
            self.url = [self objectOrNilForKey:kRecGamelistRoomlistUrl fromDictionary:dict];
            self.gameUrl = [self objectOrNilForKey:kRecGamelistRoomlistGameUrl fromDictionary:dict];
            self.specificStatus = [self objectOrNilForKey:kRecGamelistRoomlistSpecificStatus fromDictionary:dict];
            self.nickname = [self objectOrNilForKey:kRecGamelistRoomlistNickname fromDictionary:dict];
            self.online = [[self objectOrNilForKey:kRecGamelistRoomlistOnline fromDictionary:dict] doubleValue];
            self.gameName = [self objectOrNilForKey:kRecGamelistRoomlistGameName fromDictionary:dict];
            self.vodQuality = [self objectOrNilForKey:kRecGamelistRoomlistVodQuality fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.subject forKey:kRecGamelistRoomlistSubject];
    [mutableDict setValue:self.roomId forKey:kRecGamelistRoomlistRoomId];
    [mutableDict setValue:self.roomSrc forKey:kRecGamelistRoomlistRoomSrc];
    [mutableDict setValue:self.ownerUid forKey:kRecGamelistRoomlistOwnerUid];
    [mutableDict setValue:self.cateId forKey:kRecGamelistRoomlistCateId];
    [mutableDict setValue:self.specificCatalog forKey:kRecGamelistRoomlistSpecificCatalog];
    [mutableDict setValue:self.roomName forKey:kRecGamelistRoomlistRoomName];
    [mutableDict setValue:self.showTime forKey:kRecGamelistRoomlistShowTime];
    [mutableDict setValue:self.showStatus forKey:kRecGamelistRoomlistShowStatus];
    [mutableDict setValue:self.url forKey:kRecGamelistRoomlistUrl];
    [mutableDict setValue:self.gameUrl forKey:kRecGamelistRoomlistGameUrl];
    [mutableDict setValue:self.specificStatus forKey:kRecGamelistRoomlistSpecificStatus];
    [mutableDict setValue:self.nickname forKey:kRecGamelistRoomlistNickname];
    [mutableDict setValue:[NSNumber numberWithDouble:self.online] forKey:kRecGamelistRoomlistOnline];
    [mutableDict setValue:self.gameName forKey:kRecGamelistRoomlistGameName];
    [mutableDict setValue:self.vodQuality forKey:kRecGamelistRoomlistVodQuality];

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

    self.subject = [aDecoder decodeObjectForKey:kRecGamelistRoomlistSubject];
    self.roomId = [aDecoder decodeObjectForKey:kRecGamelistRoomlistRoomId];
    self.roomSrc = [aDecoder decodeObjectForKey:kRecGamelistRoomlistRoomSrc];
    self.ownerUid = [aDecoder decodeObjectForKey:kRecGamelistRoomlistOwnerUid];
    self.cateId = [aDecoder decodeObjectForKey:kRecGamelistRoomlistCateId];
    self.specificCatalog = [aDecoder decodeObjectForKey:kRecGamelistRoomlistSpecificCatalog];
    self.roomName = [aDecoder decodeObjectForKey:kRecGamelistRoomlistRoomName];
    self.showTime = [aDecoder decodeObjectForKey:kRecGamelistRoomlistShowTime];
    self.showStatus = [aDecoder decodeObjectForKey:kRecGamelistRoomlistShowStatus];
    self.url = [aDecoder decodeObjectForKey:kRecGamelistRoomlistUrl];
    self.gameUrl = [aDecoder decodeObjectForKey:kRecGamelistRoomlistGameUrl];
    self.specificStatus = [aDecoder decodeObjectForKey:kRecGamelistRoomlistSpecificStatus];
    self.nickname = [aDecoder decodeObjectForKey:kRecGamelistRoomlistNickname];
    self.online = [aDecoder decodeDoubleForKey:kRecGamelistRoomlistOnline];
    self.gameName = [aDecoder decodeObjectForKey:kRecGamelistRoomlistGameName];
    self.vodQuality = [aDecoder decodeObjectForKey:kRecGamelistRoomlistVodQuality];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_subject forKey:kRecGamelistRoomlistSubject];
    [aCoder encodeObject:_roomId forKey:kRecGamelistRoomlistRoomId];
    [aCoder encodeObject:_roomSrc forKey:kRecGamelistRoomlistRoomSrc];
    [aCoder encodeObject:_ownerUid forKey:kRecGamelistRoomlistOwnerUid];
    [aCoder encodeObject:_cateId forKey:kRecGamelistRoomlistCateId];
    [aCoder encodeObject:_specificCatalog forKey:kRecGamelistRoomlistSpecificCatalog];
    [aCoder encodeObject:_roomName forKey:kRecGamelistRoomlistRoomName];
    [aCoder encodeObject:_showTime forKey:kRecGamelistRoomlistShowTime];
    [aCoder encodeObject:_showStatus forKey:kRecGamelistRoomlistShowStatus];
    [aCoder encodeObject:_url forKey:kRecGamelistRoomlistUrl];
    [aCoder encodeObject:_gameUrl forKey:kRecGamelistRoomlistGameUrl];
    [aCoder encodeObject:_specificStatus forKey:kRecGamelistRoomlistSpecificStatus];
    [aCoder encodeObject:_nickname forKey:kRecGamelistRoomlistNickname];
    [aCoder encodeDouble:_online forKey:kRecGamelistRoomlistOnline];
    [aCoder encodeObject:_gameName forKey:kRecGamelistRoomlistGameName];
    [aCoder encodeObject:_vodQuality forKey:kRecGamelistRoomlistVodQuality];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecGamelistRoomlist *copy = [[RecGamelistRoomlist alloc] init];
    
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
