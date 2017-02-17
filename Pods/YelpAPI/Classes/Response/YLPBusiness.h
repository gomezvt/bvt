***REMOVED***
***REMOVED***  Business.h
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/5/16.
***REMOVED***
***REMOVED***

#import <Foundation/Foundation.h>

@class YLPLocation;
@class YLPCategory;

NS_ASSUME_NONNULL_BEGIN

@interface YLPBusiness : NSObject

@property (nonatomic, getter=isClosed, readonly) BOOL closed;

@property (nonatomic, readonly, nullable, copy) NSURL *imageURL;
@property (nonatomic, readonly, copy) NSURL *URL;

@property (nonatomic, readonly) double rating;
@property (nonatomic, readonly) NSUInteger reviewCount;

@property (nonatomic, readonly, copy) NSString *name;
@property (nonatomic, readonly, nullable, copy) NSString *phone;
@property (nonatomic, readonly, copy) NSString *identifier;

@property (nonatomic, readonly, copy) NSString *price;
@property (nonatomic, readonly, copy) NSArray<YLPCategory *> *categories;

@property (nonatomic, readonly) YLPLocation *location;

@property (nonatomic, strong) NSArray *businessHours;
@property (nonatomic) BOOL isOpenNow;

@property (nonatomic, strong) NSArray *reviews;
@property (nonatomic, strong) NSArray *photos;
***REMOVED***@property (nonatomic, strong) NSArray *businessPhotos;

***REMOVED***@property (nonatomic, strong) UIImage *businessThumbnail;
***REMOVED***@property (nonatomic, strong) NSMutableArray *photosArray;

***REMOVED***

NS_ASSUME_NONNULL_END
