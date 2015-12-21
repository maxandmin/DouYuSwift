//
//  RecTopData.m
//
//  Created by xin ma on 15/12/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecTopData.h"
#import "RecTopRoom.h"


NSString *const kRecTopDataId = @"id";
NSString *const kRecTopDataTitle = @"title";
NSString *const kRecTopDataPicUrl = @"pic_url";
NSString *const kRecTopDataRoom = @"room";


@interface RecTopData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecTopData

@synthesize dataIdentifier = _dataIdentifier;
@synthesize title = _title;
@synthesize picUrl = _picUrl;
@synthesize room = _room;


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
            self.dataIdentifier = [self objectOrNilForKey:kRecTopDataId fromDictionary:dict];
            self.title = [self objectOrNilForKey:kRecTopDataTitle fromDictionary:dict];
            self.picUrl = [self objectOrNilForKey:kRecTopDataPicUrl fromDictionary:dict];
            self.room = [RecTopRoom modelObjectWithDictionary:[dict objectForKey:kRecTopDataRoom]];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.dataIdentifier forKey:kRecTopDataId];
    [mutableDict setValue:self.title forKey:kRecTopDataTitle];
    [mutableDict setValue:self.picUrl forKey:kRecTopDataPicUrl];
    [mutableDict setValue:[self.room dictionaryRepresentation] forKey:kRecTopDataRoom];

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

    self.dataIdentifier = [aDecoder decodeObjectForKey:kRecTopDataId];
    self.title = [aDecoder decodeObjectForKey:kRecTopDataTitle];
    self.picUrl = [aDecoder decodeObjectForKey:kRecTopDataPicUrl];
    self.room = [aDecoder decodeObjectForKey:kRecTopDataRoom];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_dataIdentifier forKey:kRecTopDataId];
    [aCoder encodeObject:_title forKey:kRecTopDataTitle];
    [aCoder encodeObject:_picUrl forKey:kRecTopDataPicUrl];
    [aCoder encodeObject:_room forKey:kRecTopDataRoom];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecTopData *copy = [[RecTopData alloc] init];
    
    if (copy) {

        copy.dataIdentifier = [self.dataIdentifier copyWithZone:zone];
        copy.title = [self.title copyWithZone:zone];
        copy.picUrl = [self.picUrl copyWithZone:zone];
        copy.room = [self.room copyWithZone:zone];
    }
    
    return copy;
}


@end
