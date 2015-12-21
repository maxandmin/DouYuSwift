//
//  LiveBaseClass.m
//
//  Created by   on 15/12/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "LiveBaseClass.h"
#import "LiveData.h"


NSString *const kLiveBaseClassError = @"error";
NSString *const kLiveBaseClassData = @"data";


@interface LiveBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation LiveBaseClass

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
            self.error = [[self objectOrNilForKey:kLiveBaseClassError fromDictionary:dict] doubleValue];
    NSObject *receivedLiveData = [dict objectForKey:kLiveBaseClassData];
    NSMutableArray *parsedLiveData = [NSMutableArray array];
    if ([receivedLiveData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedLiveData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedLiveData addObject:[LiveData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedLiveData isKindOfClass:[NSDictionary class]]) {
       [parsedLiveData addObject:[LiveData modelObjectWithDictionary:(NSDictionary *)receivedLiveData]];
    }

    self.data = [NSArray arrayWithArray:parsedLiveData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.error] forKey:kLiveBaseClassError];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kLiveBaseClassData];

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

    self.error = [aDecoder decodeDoubleForKey:kLiveBaseClassError];
    self.data = [aDecoder decodeObjectForKey:kLiveBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_error forKey:kLiveBaseClassError];
    [aCoder encodeObject:_data forKey:kLiveBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    LiveBaseClass *copy = [[LiveBaseClass alloc] init];
    
    if (copy) {

        copy.error = self.error;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
