***REMOVED***
***REMOVED***  YLPCategory.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/11/16.
***REMOVED***
***REMOVED***

#import "YLPCategory.h"

@implementation YLPCategory

- (instancetype) initWithName:(NSString *)name alias:(NSString *)alias ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _name = name;
        _alias = alias;
    ***REMOVED***
    
    return self;
***REMOVED***

- (instancetype)initWithDictionary:(NSDictionary *)categoryDict ***REMOVED***
    return [self initWithName:categoryDict[@"title"]
                        alias:categoryDict[@"alias"]];
***REMOVED***

***REMOVED***
