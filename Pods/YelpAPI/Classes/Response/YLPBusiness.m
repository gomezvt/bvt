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
        NSString *phone = [businessDict ylp_objectMaybeNullForKey:@"phone"];
        NSString *imageURLString = [businessDict ylp_objectMaybeNullForKey:@"image_url"];
        
        _closed = [businessDict[@"is_closed"] boolValue];
        if (businessDict[@"url"])
        ***REMOVED***
            _URL = [[NSURL alloc] initWithString:businessDict[@"url"]];
        ***REMOVED***
        
        if (businessDict[@"reviews"])
        ***REMOVED***
            _reviews = businessDict[@"reviews"];
        ***REMOVED***
        _imageURL = imageURLString.length > 0 ? [[NSURL alloc] initWithString:imageURLString] : nil;
        _rating = [businessDict[@"rating"] doubleValue];
        _reviewCount = [businessDict[@"review_count"] integerValue];
        _name = businessDict[@"name"];
        _identifier = businessDict[@"id"];
        _phone = phone.length > 0 ? phone : nil;
        _price = businessDict[@"price"];
        
        ***REMOVED*** BusinessWithID returned values
        id hoursItem = businessDict[@"hours"];
        if ([hoursItem isKindOfClass:[NSArray class]])
        ***REMOVED***
            NSArray *hoursArray = (NSArray *)hoursItem;
            if ([[hoursArray lastObject] isKindOfClass:[NSDictionary class]])
            ***REMOVED***
                NSDictionary *hoursDict = [hoursArray lastObject];
                id value = hoursDict[@"is_open_now"];
                if ([value isKindOfClass:[NSNumber class]])
                ***REMOVED***
                    _isOpenNow = [value boolValue];
                ***REMOVED***
                
                _businessHours = hoursDict[@"open"];
            ***REMOVED***
        ***REMOVED***

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
