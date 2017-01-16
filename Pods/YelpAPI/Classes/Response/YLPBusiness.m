***REMOVED***
***REMOVED***  Business.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/5/16.
***REMOVED***
***REMOVED***

#import "YLPBusiness.h"
#import "YLPCategory.h"
#import "YLPCoordinate.h"
#import "YLPLocation.h"
#import "YLPResponsePrivate.h"

@implementation YLPBusiness

- (instancetype)initWithDictionary:(NSDictionary *)businessDict ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _closed = [businessDict[@"is_closed"] boolValue];

        _URL = [[NSURL alloc] initWithString:businessDict[@"url"]];
        NSString *imageURLString = [businessDict ylp_objectMaybeNullForKey:@"image_url"];
        _imageURL = imageURLString.length > 0 ? [[NSURL alloc] initWithString:imageURLString] : nil;
        
        _rating = [businessDict[@"rating"] doubleValue];
        _reviewCount = [businessDict[@"review_count"] integerValue];
        
        _name = businessDict[@"name"];
        _identifier = businessDict[@"id"];
        NSString *phone = [businessDict ylp_objectMaybeNullForKey:@"phone"];
        _phone = phone.length > 0 ? phone : nil;
        
        _categories = [self.class categoriesFromJSONArray:businessDict[@"categories"]];
        YLPCoordinate *coordinate = [self.class coordinateFromJSONDictionary:businessDict[@"coordinates"]];
        _location = [[YLPLocation alloc] initWithDictionary:businessDict[@"location"] coordinate:coordinate];
    ***REMOVED***
    return self;
***REMOVED***

+ (NSArray *)categoriesFromJSONArray:(NSArray *)categoriesJSON ***REMOVED***
    NSMutableArray *mutableCategories = [[NSMutableArray alloc] init];
    for (NSDictionary *category in categoriesJSON) ***REMOVED***
        [mutableCategories addObject:[[YLPCategory alloc] initWithDictionary:category]];
    ***REMOVED***
    return mutableCategories;
***REMOVED***

+ (YLPCoordinate *)coordinateFromJSONDictionary:(NSDictionary *)coordinatesDict ***REMOVED***
    NSNumber *latitude = [coordinatesDict ylp_objectMaybeNullForKey:@"latitude"];
    NSNumber *longitude = [coordinatesDict ylp_objectMaybeNullForKey:@"longitude"];
    if (latitude && longitude) ***REMOVED***
        return [[YLPCoordinate alloc] initWithLatitude:[latitude doubleValue]
                                             longitude:[longitude doubleValue]];
    ***REMOVED*** else ***REMOVED***
        return nil;
    ***REMOVED***
***REMOVED***

***REMOVED***
