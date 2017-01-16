***REMOVED***
***REMOVED***  YLPSearch.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/28/16.
***REMOVED***
***REMOVED***

#import "YLPSearch.h"
#import "YLPResponsePrivate.h"

@implementation YLPSearch
- (instancetype)initWithDictionary:(NSDictionary *)searchDict ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _total = [searchDict[@"total"] unsignedIntegerValue];
        _businesses = [self.class businessesFromJSONArray:searchDict[@"businesses"]];
    ***REMOVED***
    
    return self;
***REMOVED***

+ (NSArray *)businessesFromJSONArray:(NSArray *)businessesJSON ***REMOVED***
    NSMutableArray<YLPBusiness *> *mutableBusinessesJSON = [[NSMutableArray alloc] init];
    
    for (NSDictionary *business in businessesJSON) ***REMOVED***
        [mutableBusinessesJSON addObject:[[YLPBusiness alloc] initWithDictionary:business]];
    ***REMOVED***
    
    return mutableBusinessesJSON;
***REMOVED***

***REMOVED***
