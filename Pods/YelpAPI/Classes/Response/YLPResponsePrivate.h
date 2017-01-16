***REMOVED***
***REMOVED***  YLPResponsePrivate.h
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/11/16.
***REMOVED***
***REMOVED***
#import "YLPBusiness.h"
#import "YLPBusinessReviews.h"
#import "YLPCategory.h"
#import "YLPLocation.h"
#import "YLPReview.h"
#import "YLPSearch.h"
#import "YLPUser.h"

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary<KeyType, ObjectType> (YLPUtils)
- (nullable ObjectType)ylp_objectMaybeNullForKey:(KeyType)key;
***REMOVED***

@interface YLPBusiness ()
- (instancetype)initWithDictionary:(NSDictionary *)businessDict;
***REMOVED***

@interface YLPBusinessReviews ()
- (instancetype)initWithDictionary:(NSDictionary *)reviewsDict;
***REMOVED***

@interface YLPCategory ()
- (instancetype)initWithName:(NSString *)name alias:(NSString *)alias;
- (instancetype)initWithDictionary:(NSDictionary *)categoryDict;
***REMOVED***

@interface YLPLocation ()
- (instancetype)initWithDictionary:(NSDictionary *)locationDict coordinate:(nullable YLPCoordinate *)coordinate;
***REMOVED***

@interface YLPReview ()
- (instancetype)initWithDictionary:(NSDictionary *)reviewDict;
***REMOVED***

@interface YLPSearch ()
- (instancetype)initWithDictionary:(NSDictionary *)searchDict;
***REMOVED***

@interface YLPUser ()
- (instancetype)initWithDictionary:(NSDictionary *)userDict;
***REMOVED***

NS_ASSUME_NONNULL_END
