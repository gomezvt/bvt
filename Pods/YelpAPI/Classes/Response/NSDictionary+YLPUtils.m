***REMOVED***
***REMOVED***  NSDictionary+YLPUtils.m
***REMOVED***  YelpAPI
***REMOVED***
***REMOVED***  Created by Steven Sheldon on 11/17/16.
***REMOVED***
***REMOVED***

#import "YLPResponsePrivate.h"

@implementation NSDictionary (YLPUtils)

- (id)ylp_objectMaybeNullForKey:(id)key ***REMOVED***
    id obj = self[key];
    if ([obj isEqual:[NSNull null]]) ***REMOVED***
        return nil;
    ***REMOVED***
    return obj;
***REMOVED***

***REMOVED***
