***REMOVED***
***REMOVED***  YLPQueryPrivate.h
***REMOVED***  YelpAPI
***REMOVED***
***REMOVED***  Created by Steven Sheldon on 6/26/16.
***REMOVED***
***REMOVED***

#import "YLPQuery.h"

typedef NS_ENUM(NSUInteger, YLPSearchMode) ***REMOVED***
    YLPSearchModeLocation,
    YLPSearchModeCoordinate,
***REMOVED***;

NS_ASSUME_NONNULL_BEGIN

@interface YLPQuery ()

@property (assign, nonatomic) YLPSearchMode mode;
@property (copy, nonatomic, nullable) NSString *location;
@property (strong, nonatomic, nullable) YLPCoordinate *coordinate;

- (NSDictionary *)parameters;

***REMOVED***

NS_ASSUME_NONNULL_END
