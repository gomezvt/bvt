***REMOVED***
***REMOVED***  YLPLocation.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/12/16.
***REMOVED***
***REMOVED***

#import "YLPLocation.h"
#import "YLPCoordinate.h"
#import "YLPResponsePrivate.h"

@implementation YLPLocation

- (instancetype)initWithDictionary:(NSDictionary *)location coordinate:(YLPCoordinate *)coordinate ***REMOVED***
    if (self = [super init]) ***REMOVED***
        _city = location[@"city"];
        _stateCode = location[@"state"];
        _postalCode = location[@"zip_code"];
        _countryCode = location[@"country"];
        
        NSMutableArray *address = [NSMutableArray array];
        for (NSString *addressKey in @[@"address1", @"address2", @"address3"]) ***REMOVED***
            NSString *addressLine = [location ylp_objectMaybeNullForKey:addressKey];
            ***REMOVED*** Skip empty lines
            if (addressLine.length > 0) ***REMOVED***
                [address addObject:addressLine];
            ***REMOVED***
        ***REMOVED***
        _address = address;

        _coordinate = coordinate;
    ***REMOVED***
    
    return self;
***REMOVED***

***REMOVED***
