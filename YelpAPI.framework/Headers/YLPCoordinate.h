***REMOVED***
***REMOVED***  YLPCoordinate.h
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/13/16.
***REMOVED***
***REMOVED***

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YLPCoordinate : NSObject

@property (nonatomic, readonly) double latitude;
@property (nonatomic, readonly) double longitude;

- (instancetype)initWithLatitude:(double)latitude longitude:(double)longitude;

***REMOVED***

NS_ASSUME_NONNULL_END