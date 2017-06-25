***REMOVED***
***REMOVED***  GADSearchRequest.h
***REMOVED***  Google Mobile Ads SDK
***REMOVED***
***REMOVED***  Copyright 2011 Google Inc. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Search ad border types.
typedef NS_ENUM(NSUInteger, GADSearchBorderType) ***REMOVED***
  kGADSearchBorderTypeNone,    ***REMOVED***/< No border.
  kGADSearchBorderTypeDashed,  ***REMOVED***/< Dashed line border.
  kGADSearchBorderTypeDotted,  ***REMOVED***/< Dotted line border.
  kGADSearchBorderTypeSolid    ***REMOVED***/< Solid line border.
***REMOVED***;

***REMOVED***/ Search ad call button color types.
typedef NS_ENUM(NSUInteger, GADSearchCallButtonColor) ***REMOVED***
  kGADSearchCallButtonLight,   ***REMOVED***/< Light button color.
  kGADSearchCallButtonMedium,  ***REMOVED***/< Medium button color.
  kGADSearchCallButtonDark     ***REMOVED***/< Dark button color.
***REMOVED***;

***REMOVED***/ Specifies parameters for search ads.
@interface GADSearchRequest : GADRequest

***REMOVED***/ The search ad query.
@property(nonatomic, copy, GAD_NULLABLE) NSString *query;
***REMOVED***/ The search ad background color.
@property(nonatomic, readonly, copy, GAD_NULLABLE) UIColor *backgroundColor;
***REMOVED***/ The search ad gradient "from" color.
@property(nonatomic, readonly, copy, GAD_NULLABLE) UIColor *gradientFrom;
***REMOVED***/ The search ad gradient "to" color.
@property(nonatomic, readonly, copy, GAD_NULLABLE) UIColor *gradientTo;
***REMOVED***/ The search ad header color.
@property(nonatomic, copy, GAD_NULLABLE) UIColor *headerColor;
***REMOVED***/ The search ad description text color.
@property(nonatomic, copy, GAD_NULLABLE) UIColor *descriptionTextColor;
***REMOVED***/ The search ad anchor text color.
@property(nonatomic, copy, GAD_NULLABLE) UIColor *anchorTextColor;
***REMOVED***/ The search ad text font family.
@property(nonatomic, copy, GAD_NULLABLE) NSString *fontFamily;
***REMOVED***/ The search ad header text size.
@property(nonatomic, assign) NSUInteger headerTextSize;
***REMOVED***/ The search ad border color.
@property(nonatomic, copy, GAD_NULLABLE) UIColor *borderColor;
***REMOVED***/ The search ad border type.
@property(nonatomic, assign) GADSearchBorderType borderType;
***REMOVED***/ The search ad border thickness.
@property(nonatomic, assign) NSUInteger borderThickness;
***REMOVED***/ The search ad custom channels.
@property(nonatomic, copy, GAD_NULLABLE) NSString *customChannels;
***REMOVED***/ The search ad call button color.
@property(nonatomic, assign) GADSearchCallButtonColor callButtonColor;

***REMOVED***/ A solid background color for rendering the ad. The background of the ad
***REMOVED***/ can either be a solid color, or a gradient, which can be specified through
***REMOVED***/ setBackgroundGradientFrom:toColor: method. If both solid and gradient
***REMOVED***/ background is requested, only the latter is considered.
- (void)setBackgroundSolid:(UIColor *)color;

***REMOVED***/ A linear gradient background color for rendering the ad. The background of
***REMOVED***/ the ad can either be a linear gradient, or a solid color, which can be
***REMOVED***/ specified through setBackgroundSolid method. If both solid and gradient
***REMOVED***/ background is requested, only the latter is considered.
- (void)setBackgroundGradientFrom:(UIColor *)from toColor:(UIColor *)toColor;

***REMOVED***

GAD_ASSUME_NONNULL_END
