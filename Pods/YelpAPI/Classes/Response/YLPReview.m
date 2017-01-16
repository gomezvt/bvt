***REMOVED***
***REMOVED***  YLPReview.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/13/16.
***REMOVED***
***REMOVED***

#import "YLPReview.h"
#import "YLPUser.h"
#import "YLPResponsePrivate.h"

@implementation YLPReview

- (instancetype)initWithDictionary:(NSDictionary *)reviewDict ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _rating = [reviewDict[@"rating"] doubleValue];
        _excerpt = reviewDict[@"text"];
        _timeCreated = [self.class dateFromTimestamp:reviewDict[@"time_created"]];
        _user = [[YLPUser alloc] initWithDictionary:reviewDict[@"user"]];
    ***REMOVED***
    
    return self;
***REMOVED***

+ (NSDate *)dateFromTimestamp:(NSString *)timestamp ***REMOVED***
    static NSDateFormatter *dateFormatter = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^***REMOVED***
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.dateFormat = @"yyyy-MM-dd' 'HH:mm:ss";
        dateFormatter.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"PST"];
    ***REMOVED***);

    return [dateFormatter dateFromString:timestamp];
***REMOVED***

***REMOVED***
