***REMOVED***
***REMOVED***  YLPLocation.h
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/12/16.
***REMOVED***
***REMOVED***

#import <Foundation/Foundation.h>

@class YLPCoordinate;

NS_ASSUME_NONNULL_BEGIN

@interface YLPLocation : NSObject

@property (nonatomic, readonly, copy) NSString *city;
@property (nonatomic, readonly, copy) NSString *stateCode;
@property (nonatomic, readonly, copy) NSString *postalCode;
@property (nonatomic, readonly, copy) NSString *countryCode;

@property (nonatomic, readonly, copy) NSArray<NSString *> *address;

@property (nonatomic, readonly, nullable) YLPCoordinate *coordinate;

***REMOVED***

NS_ASSUME_NONNULL_END
