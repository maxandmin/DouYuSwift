//
//  ProgramaData.m
//
//  Created by   on 15/12/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ProgramaData.h"


NSString *const kProgramaDataCateId = @"cate_id";
NSString *const kProgramaDataGameUrl = @"game_url";
NSString *const kProgramaDataGameName = @"game_name";
NSString *const kProgramaDataGameIcon = @"game_icon";
NSString *const kProgramaDataGameSrc = @"game_src";
NSString *const kProgramaDataShortName = @"short_name";
NSString *const kProgramaDataOnlineRoom = @"online_room";
NSString *const kProgramaDataOnlineRoomIos = @"online_room_ios";


@interface ProgramaData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProgramaData

@synthesize cateId = _cateId;
@synthesize gameUrl = _gameUrl;
@synthesize gameName = _gameName;
@synthesize gameIcon = _gameIcon;
@synthesize gameSrc = _gameSrc;
@synthesize shortName = _shortName;
@synthesize onlineRoom = _onlineRoom;
@synthesize onlineRoomIos = _onlineRoomIos;


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
            self.cateId = [self objectOrNilForKey:kProgramaDataCateId fromDictionary:dict];
            self.gameUrl = [self objectOrNilForKey:kProgramaDataGameUrl fromDictionary:dict];
            self.gameName = [self objectOrNilForKey:kProgramaDataGameName fromDictionary:dict];
            self.gameIcon = [self objectOrNilForKey:kProgramaDataGameIcon fromDictionary:dict];
            self.gameSrc = [self objectOrNilForKey:kProgramaDataGameSrc fromDictionary:dict];
            self.shortName = [self objectOrNilForKey:kProgramaDataShortName fromDictionary:dict];
            self.onlineRoom = [self objectOrNilForKey:kProgramaDataOnlineRoom fromDictionary:dict];
            self.onlineRoomIos = [self objectOrNilForKey:kProgramaDataOnlineRoomIos fromDictionary:dict];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.cateId forKey:kProgramaDataCateId];
    [mutableDict setValue:self.gameUrl forKey:kProgramaDataGameUrl];
    [mutableDict setValue:self.gameName forKey:kProgramaDataGameName];
    [mutableDict setValue:self.gameIcon forKey:kProgramaDataGameIcon];
    [mutableDict setValue:self.gameSrc forKey:kProgramaDataGameSrc];
    [mutableDict setValue:self.shortName forKey:kProgramaDataShortName];
    [mutableDict setValue:self.onlineRoom forKey:kProgramaDataOnlineRoom];
    [mutableDict setValue:self.onlineRoomIos forKey:kProgramaDataOnlineRoomIos];

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

    self.cateId = [aDecoder decodeObjectForKey:kProgramaDataCateId];
    self.gameUrl = [aDecoder decodeObjectForKey:kProgramaDataGameUrl];
    self.gameName = [aDecoder decodeObjectForKey:kProgramaDataGameName];
    self.gameIcon = [aDecoder decodeObjectForKey:kProgramaDataGameIcon];
    self.gameSrc = [aDecoder decodeObjectForKey:kProgramaDataGameSrc];
    self.shortName = [aDecoder decodeObjectForKey:kProgramaDataShortName];
    self.onlineRoom = [aDecoder decodeObjectForKey:kProgramaDataOnlineRoom];
    self.onlineRoomIos = [aDecoder decodeObjectForKey:kProgramaDataOnlineRoomIos];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_cateId forKey:kProgramaDataCateId];
    [aCoder encodeObject:_gameUrl forKey:kProgramaDataGameUrl];
    [aCoder encodeObject:_gameName forKey:kProgramaDataGameName];
    [aCoder encodeObject:_gameIcon forKey:kProgramaDataGameIcon];
    [aCoder encodeObject:_gameSrc forKey:kProgramaDataGameSrc];
    [aCoder encodeObject:_shortName forKey:kProgramaDataShortName];
    [aCoder encodeObject:_onlineRoom forKey:kProgramaDataOnlineRoom];
    [aCoder encodeObject:_onlineRoomIos forKey:kProgramaDataOnlineRoomIos];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProgramaData *copy = [[ProgramaData alloc] init];
    
    if (copy) {

        copy.cateId = [self.cateId copyWithZone:zone];
        copy.gameUrl = [self.gameUrl copyWithZone:zone];
        copy.gameName = [self.gameName copyWithZone:zone];
        copy.gameIcon = [self.gameIcon copyWithZone:zone];
        copy.gameSrc = [self.gameSrc copyWithZone:zone];
        copy.shortName = [self.shortName copyWithZone:zone];
        copy.onlineRoom = [self.onlineRoom copyWithZone:zone];
        copy.onlineRoomIos = [self.onlineRoomIos copyWithZone:zone];
    }
    
    return copy;
}


@end
