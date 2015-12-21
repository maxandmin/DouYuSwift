//
//  ProgramaBaseClass.m
//
//  Created by   on 15/12/20
//  Copyright (c) 2015 __MyCompanyName__. All rights reserved.
//

#import "ProgramaBaseClass.h"
#import "ProgramaData.h"


NSString *const kProgramaBaseClassError = @"error";
NSString *const kProgramaBaseClassData = @"data";


@interface ProgramaBaseClass ()

- (id)objectOrNilForKey:(id)aKey fromDictionary:(NSDictionary *)dict;

@end

@implementation ProgramaBaseClass

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
            self.error = [[self objectOrNilForKey:kProgramaBaseClassError fromDictionary:dict] doubleValue];
    NSObject *receivedProgramaData = [dict objectForKey:kProgramaBaseClassData];
    NSMutableArray *parsedProgramaData = [NSMutableArray array];
    if ([receivedProgramaData isKindOfClass:[NSArray class]]) {
        for (NSDictionary *item in (NSArray *)receivedProgramaData) {
            if ([item isKindOfClass:[NSDictionary class]]) {
                [parsedProgramaData addObject:[ProgramaData modelObjectWithDictionary:item]];
            }
       }
    } else if ([receivedProgramaData isKindOfClass:[NSDictionary class]]) {
       [parsedProgramaData addObject:[ProgramaData modelObjectWithDictionary:(NSDictionary *)receivedProgramaData]];
    }

    self.data = [NSArray arrayWithArray:parsedProgramaData];

    }
    
    return self;
    
}

- (NSDictionary *)dictionaryRepresentation
{
    NSMutableDictionary *mutableDict = [NSMutableDictionary dictionary];
    [mutableDict setValue:[NSNumber numberWithDouble:self.error] forKey:kProgramaBaseClassError];
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
    [mutableDict setValue:[NSArray arrayWithArray:tempArrayForData] forKey:kProgramaBaseClassData];

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

    self.error = [aDecoder decodeDoubleForKey:kProgramaBaseClassError];
    self.data = [aDecoder decodeObjectForKey:kProgramaBaseClassData];
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder
{

    [aCoder encodeDouble:_error forKey:kProgramaBaseClassError];
    [aCoder encodeObject:_data forKey:kProgramaBaseClassData];
}

- (id)copyWithZone:(NSZone *)zone
{
    ProgramaBaseClass *copy = [[ProgramaBaseClass alloc] init];
    
    if (copy) {

        copy.error = self.error;
        copy.data = [self.data copyWithZone:zone];
    }
    
    return copy;
}


@end
