//
//  RecTopBaseClass.m
//
//  Created by xin ma on 15/12/10
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecTopBaseClass.h"
#import "RecTopData.h"


NSString *const kRecTopBaseClassError = @"error";
NSString *const kRecTopBaseClassData = @"data";


@interface RecTopBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecTopBaseClass

@synthesize error = _error;
@synthesize data = _data;


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
            self.error = [[self objectOrNilForKey:kRecTopBaseClassError fromDictionary:dict] doubleValue];
    NSObject *receivedRecTopData = [dict objectForKey:kRecTopBaseClassData];
    NSMutableArray *parsedRecTopData = [NSMutableArray array];
    if ([receivedRecTopData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecTopData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecTopData addObject:[RecTopData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecTopData isKindOfClass:[NSDictionary class]]) {
       [parsedRecTopData addObject:[RecTopData modelObjectWithDictionary:(NSDictionary *)receivedRecTopData]];
    }

    self.data = [NSArray arrayWithArray:parsedRecTopData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.error] forKey:kRecTopBaseClassError];
    NSMutableArray *tempArrayForData = [NSMutableArray array];
    for (NSObject *subArrayObject in self.data) {
        if([subArrayObject respondsToSelector:@selector(dictionaryRepresentation)]) {
            // This class is a model object
            [tempArrayForData addObject:[subArrayObject performSelector:@selector(dictionaryRepresentation)]];
        } else {
            // Generic object
            [tempArrayForData addObject:subArrayObject];
        }
    }
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kRecTopBaseClassData];

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

    self.error = [aDecoder decodeDoubleForKey:kRecTopBaseClassError];
    self.data = [aDecoder decodeObjectForKey:kRecTopBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_error forKey:kRecTopBaseClassError];
    [aCoder encodeObject:_data forKey:kRecTopBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecTopBaseClass *copy = [[RecTopBaseClass alloc] init];
    
    if (copy) {

        copy.error = self.error;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
