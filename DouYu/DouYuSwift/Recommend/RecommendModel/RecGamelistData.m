//
//  RecGamelistData.m
//
//  Created by   on 15/12/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecGamelistData.h"
#import "RecGamelistRoomlist.h"


NSString *const kRecGamelistDataTitle = @"title";
NSString *const kRecGamelistDataCateId = @"cate_id";
NSString *const kRecGamelistDataRoomlist = @"roomlist";


@interface RecGamelistData ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecGamelistData

@synthesize title = _title;
@synthesize cateId = _cateId;
@synthesize roomlist = _roomlist;


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
            self.title = [self objectOrNilForKey:kRecGamelistDataTitle fromDictionary:dict];
            self.cateId = [self objectOrNilForKey:kRecGamelistDataCateId fromDictionary:dict];
    NSObject *receivedRecGamelistRoomlist = [dict objectForKey:kRecGamelistDataRoomlist];
    NSMutableArray *parsedRecGamelistRoomlist = [NSMutableArray array];
    if ([receivedRecGamelistRoomlist isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecGamelistRoomlist) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecGamelistRoomlist addObject:[RecGamelistRoomlist modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecGamelistRoomlist isKindOfClass:[NSDictionary class]]) {
       [parsedRecGamelistRoomlist addObject:[RecGamelistRoomlist modelObjectWithDictionary:(NSDictionary *)receivedRecGamelistRoomlist]];
    }

    self.roomlist = [NSArray arrayWithArray:parsedRecGamelistRoomlist];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:self.title forKey:kRecGamelistDataTitle];
    [mutableDict setValue:self.cateId forKey:kRecGamelistDataCateId];
    NSMutableArray *tempArrayForRoomlist = [NSMutableArray array];
    for (NSObject *subArrayObject in self.roomlist) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForRoomlist addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForRoomlist addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForRoomlist] forKey:kRecGamelistDataRoomlist];

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

    self.title = [aDecoder decodeObjectForKey:kRecGamelistDataTitle];
    self.cateId = [aDecoder decodeObjectForKey:kRecGamelistDataCateId];
    self.roomlist = [aDecoder decodeObjectForKey:kRecGamelistDataRoomlist];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeObject:_title forKey:kRecGamelistDataTitle];
    [aCoder encodeObject:_cateId forKey:kRecGamelistDataCateId];
    [aCoder encodeObject:_roomlist forKey:kRecGamelistDataRoomlist];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecGamelistData *copy = [[RecGamelistData alloc] init];
    
    if (copy) {

        copy.title = [self.title copyWithZone:zone];
        copy.cateId = [self.cateId copyWithZone:zone];
        copy.roomlist = [self.roomlist copyWithZone:zone];
    }
    
    return copy;
}


@end
