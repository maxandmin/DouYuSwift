//
//  RecGamelistBaseClass.m
//
//  Created by   on 15/12/12
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecGamelistBaseClass.h"
#import "RecGamelistData.h"


NSString *const kRecGamelistBaseClassError = @"error";
NSString *const kRecGamelistBaseClassData = @"data";


@interface RecGamelistBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecGamelistBaseClass

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
            self.error = [[self objectOrNilForKey:kRecGamelistBaseClassError fromDictionary:dict] doubleValue];
    NSObject *receivedRecGamelistData = [dict objectForKey:kRecGamelistBaseClassData];
    NSMutableArray *parsedRecGamelistData = [NSMutableArray array];
    if ([receivedRecGamelistData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecGamelistData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecGamelistData addObject:[RecGamelistData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecGamelistData isKindOfClass:[NSDictionary class]]) {
       [parsedRecGamelistData addObject:[RecGamelistData modelObjectWithDictionary:(NSDictionary *)receivedRecGamelistData]];
    }

    self.data = [NSArray arrayWithArray:parsedRecGamelistData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.error] forKey:kRecGamelistBaseClassError];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kRecGamelistBaseClassData];

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

    self.error = [aDecoder decodeDoubleForKey:kRecGamelistBaseClassError];
    self.data = [aDecoder decodeObjectForKey:kRecGamelistBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_error forKey:kRecGamelistBaseClassError];
    [aCoder encodeObject:_data forKey:kRecGamelistBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecGamelistBaseClass *copy = [[RecGamelistBaseClass alloc] init];
    
    if (copy) {

        copy.error = self.error;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
