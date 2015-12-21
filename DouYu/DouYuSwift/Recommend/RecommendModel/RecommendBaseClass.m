//
//  RecommendBaseClass.m
//
//  Created by xin ma on 15/12/9
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "RecommendBaseClass.h"
#import "RecommendData.h"


NSString *const kRecommendBaseClassError = @"error";
NSString *const kRecommendBaseClassData = @"data";


@interface RecommendBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation RecommendBaseClass

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
            self.error = [[self objectOrNilForKey:kRecommendBaseClassError fromDictionary:dict] doubleValue];
    NSObject *receivedRecommendData = [dict objectForKey:kRecommendBaseClassData];
    NSMutableArray *parsedRecommendData = [NSMutableArray array];
    if ([receivedRecommendData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedRecommendData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedRecommendData addObject:[RecommendData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedRecommendData isKindOfClass:[NSDictionary class]]) {
       [parsedRecommendData addObject:[RecommendData modelObjectWithDictionary:(NSDictionary *)receivedRecommendData]];
    }

    self.data = [NSArray arrayWithArray:parsedRecommendData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.error] forKey:kRecommendBaseClassError];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kRecommendBaseClassData];

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

    self.error = [aDecoder decodeDoubleForKey:kRecommendBaseClassError];
    self.data = [aDecoder decodeObjectForKey:kRecommendBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_error forKey:kRecommendBaseClassError];
    [aCoder encodeObject:_data forKey:kRecommendBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    RecommendBaseClass *copy = [[RecommendBaseClass alloc] init];
    
    if (copy) {

        copy.error = self.error;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
