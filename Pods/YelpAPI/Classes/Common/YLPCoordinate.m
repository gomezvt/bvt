***REMOVED***
***REMOVED***  YLPCoordinate.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/13/16.
***REMOVED***
***REMOVED***

#import "YLPCoordinate.h"

@implementation YLPCoordinate
- (instancetype)initWithLatitude:(double)latitude longitude:(double)longitude ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _latitude = latitude;
        _longitude = longitude;
    ***REMOVED***
    return self;
***REMOVED***


- (NSString *)description ***REMOVED***
    return [NSString stringWithFormat:@"%f,%f", self.latitude, self.longitude];
***REMOVED***
***REMOVED***
