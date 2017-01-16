***REMOVED***
***REMOVED***  YLPUser.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/13/16.
***REMOVED***
***REMOVED***

#import "YLPUser.h"
#import "YLPResponsePrivate.h"

@implementation YLPUser

- (instancetype)initWithDictionary:(NSDictionary *)userDict ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _name = userDict[@"name"];
        NSString *imageURLString = [userDict ylp_objectMaybeNullForKey:@"image_url"];
        _imageURL = imageURLString ? [NSURL URLWithString:imageURLString] : nil;
    ***REMOVED***
    return self;
***REMOVED***

***REMOVED***
