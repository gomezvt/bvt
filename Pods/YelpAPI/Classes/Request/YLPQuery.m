***REMOVED***
***REMOVED***  YLPQuery.m
***REMOVED***  YelpAPI
***REMOVED***
***REMOVED***  Created by Steven Sheldon on 6/26/16.
***REMOVED***
***REMOVED***

#import "YLPQuery.h"
#import "YLPQueryPrivate.h"
#import "YLPCoordinate.h"

@implementation YLPQuery

- (instancetype)initWithLocation:(NSString *)location ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _mode = YLPSearchModeLocation;
        _location = [location copy];
    ***REMOVED***
    return self;
***REMOVED***

- (instancetype)initWithCoordinate:(YLPCoordinate *)coordinate ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _mode = YLPSearchModeCoordinate;
        _coordinate = coordinate;
    ***REMOVED***
    return self;
***REMOVED***

- (NSArray<NSString *> *)categoryFilter ***REMOVED***
    return _categoryFilter ?: @[];
***REMOVED***

- (NSString *)sortParameter ***REMOVED***
    switch (self.sort) ***REMOVED***
        case YLPSortTypeBestMatched:
            return @"best_match";
        case YLPSortTypeHighestRated:
            return @"rating";
        case YLPSortTypeDistance:
            return @"distance";
        case YLPSortTypeMostReviewed:
            return @"review_count";
    ***REMOVED***
***REMOVED***

- (NSDictionary *)parameters ***REMOVED***
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    switch (self.mode) ***REMOVED***
        case YLPSearchModeLocation:
            params[@"location"] = self.location;
            break;
        case YLPSearchModeCoordinate:
            params[@"latitude"] = @(self.coordinate.latitude);
            params[@"longitude"] = @(self.coordinate.longitude);
            break;
    ***REMOVED***

    if (self.term) ***REMOVED***
        params[@"term"] = self.term;
    ***REMOVED***
    if (self.limit) ***REMOVED***
        params[@"limit"] = @(self.limit);
    ***REMOVED***
    if (self.offset) ***REMOVED***
        params[@"offset"] = @(self.offset);
    ***REMOVED***
    if (self.sort != YLPSortTypeBestMatched) ***REMOVED***
        params[@"sort_by"] = [self sortParameter];
    ***REMOVED***
    if (self.categoryFilter.count > 0) ***REMOVED***
        params[@"categories"] = [self.categoryFilter componentsJoinedByString:@","];
    ***REMOVED***
    if (self.radiusFilter > 0) ***REMOVED***
        params[@"radius"] = @(self.radiusFilter);
    ***REMOVED***
    if (self.dealsFilter) ***REMOVED***
        params[@"attributes"] = @"deals";
    ***REMOVED***

    return params;
***REMOVED***

***REMOVED***
