***REMOVED***
***REMOVED***  YLPBusinessReviews.m
***REMOVED***  YelpAPI
***REMOVED***
***REMOVED***  Created by Steven Sheldon on 10/21/16.
***REMOVED***
***REMOVED***

#import "YLPBusinessReviews.h"
#import "YLPResponsePrivate.h"

@implementation YLPBusinessReviews

- (instancetype)initWithDictionary:(NSDictionary *)reviewsDict ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _total = [reviewsDict[@"total"] unsignedIntegerValue];
        _reviews = [self.class reviewsFromJSONArray:reviewsDict[@"reviews"]];
    ***REMOVED***
    return self;
***REMOVED***

+ (NSArray *)reviewsFromJSONArray:(NSArray *)reviewsJSON ***REMOVED***
    NSMutableArray<YLPReview *> *reviews = [[NSMutableArray alloc] init];
    for (NSDictionary *review in reviewsJSON) ***REMOVED***
        [reviews addObject:[[YLPReview alloc] initWithDictionary:review]];
    ***REMOVED***
    return reviews;
***REMOVED***

***REMOVED***
