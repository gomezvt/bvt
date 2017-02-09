//
//  Business.m
//  Pods
//
//  Created by David Chen on 1/5/16.
//
//

#import "YLPBusiness.h"
#import "YLPCategory.h"
#import "YLPCoordinate.h"
#import "YLPLocation.h"
#import "YLPResponsePrivate.h"

@implementation YLPBusiness

- (instancetype)initWithDictionary:(NSDictionary *)businessDict {
    if (self = [super init]) {
        NSString *imageURLString = [businessDict ylp_objectMaybeNullForKey:@"image_url"];

        _closed = [businessDict[@"is_closed"] boolValue];

        _URL = [[NSURL alloc] initWithString:businessDict[@"url"]];
        _imageURL = imageURLString.length > 0 ? [[NSURL alloc] initWithString:imageURLString] : nil;
        
        _rating = [businessDict[@"rating"] doubleValue];
        _reviewCount = [businessDict[@"review_count"] integerValue];
        
        _name = businessDict[@"name"];
        _identifier = businessDict[@"id"];
        NSString *phone = [businessDict ylp_objectMaybeNullForKey:@"phone"];
        _phone = phone.length > 0 ? phone : nil;
        _price = businessDict[@"price"];

        
        // BusinessWithID returned values

        id hoursItem = businessDict[@"hours"];
        if ([hoursItem isKindOfClass:[NSArray class]])
        {
            NSArray *hours = [NSArray arrayWithObject:[hoursItem lastObject]];
            self.hours = [hours lastObject];
            self.isOpenNow = self.hours[@"is_open_now"];
        }

        _categories = [self.class categoriesFromJSONArray:businessDict[@"categories"]];
        YLPCoordinate *coordinate = [self.class coordinateFromJSONDictionary:businessDict[@"coordinates"]];
        _location = [[YLPLocation alloc] initWithDictionary:businessDict[@"location"] coordinate:coordinate];
    }
    return self;
}

+ (NSArray *)categoriesFromJSONArray:(NSArray *)categoriesJSON {
    NSMutableArray *mutableCategories = [[NSMutableArray alloc] init];
    for (NSDictionary *category in categoriesJSON) {
        [mutableCategories addObject:[[YLPCategory alloc] initWithDictionary:category]];
    }
    return mutableCategories;
}

+ (YLPCoordinate *)coordinateFromJSONDictionary:(NSDictionary *)coordinatesDict {
    NSNumber *latitude = [coordinatesDict ylp_objectMaybeNullForKey:@"latitude"];
    NSNumber *longitude = [coordinatesDict ylp_objectMaybeNullForKey:@"longitude"];
    if (latitude && longitude) {
        return [[YLPCoordinate alloc] initWithLatitude:[latitude doubleValue]
                                             longitude:[longitude doubleValue]];
    } else {
        return nil;
    }
}

@end
