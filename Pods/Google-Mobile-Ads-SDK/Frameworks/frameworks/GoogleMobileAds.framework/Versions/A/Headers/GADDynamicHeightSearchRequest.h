***REMOVED***
***REMOVED***  GADDynamicHeightSearchRequest.h
***REMOVED***  GoogleMobileAds
***REMOVED***
***REMOVED***  Copyright © 2016 Google Inc. All rights reserved.
***REMOVED***

#import <GoogleMobileAds/GADRequest.h>
#import <GoogleMobileAds/GoogleMobileAdsDefines.h>

GAD_ASSUME_NONNULL_BEGIN

***REMOVED***/ Use to configure Custom Search Ad (CSA) ad requests. A dynamic height search banner can contain
***REMOVED***/ multiple ads and the height is set dynamically based on the ad contents. Please cross-reference
***REMOVED***/ the property sections and properties with the official reference document:
***REMOVED***/ https:***REMOVED***developers.google.com/custom-search-ads/docs/reference
@interface GADDynamicHeightSearchRequest : GADRequest

#pragma mark - Page Level Parameters

#pragma mark Required

***REMOVED***/ The CSA "query" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *query;

***REMOVED***/ The CSA "adPage" parameter.
@property(nonatomic, assign) NSInteger adPage;

#pragma mark Configuration Settings

***REMOVED***/ Indicates if the CSA "adTest" parameter is enabled.
@property(nonatomic, assign) BOOL adTestEnabled;

***REMOVED***/ The CSA "channel" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *channel;

***REMOVED***/ The CSA "hl" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *hostLanguage;

#pragma mark Layout and Styling

***REMOVED***/ The CSA "colorLocation" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *locationExtensionTextColor;

***REMOVED***/ The CSA "fontSizeLocation" parameter.
@property(nonatomic, assign) CGFloat locationExtensionFontSize;

#pragma mark Ad Extensions

***REMOVED***/ Indicates if the CSA "clickToCall" parameter is enabled.
@property(nonatomic, assign) BOOL clickToCallExtensionEnabled;

***REMOVED***/ Indicates if the CSA "location" parameter is enabled.
@property(nonatomic, assign) BOOL locationExtensionEnabled;

***REMOVED***/ Indicates if the CSA "plusOnes" parameter is enabled.
@property(nonatomic, assign) BOOL plusOnesExtensionEnabled;

***REMOVED***/ Indicates if the CSA "sellerRatings" parameter is enabled.
@property(nonatomic, assign) BOOL sellerRatingsExtensionEnabled;

***REMOVED***/ Indicates if the CSA "siteLinks" parameter is enabled.
@property(nonatomic, assign) BOOL siteLinksExtensionEnabled;

#pragma mark - Unit Level Parameters

#pragma mark Required

***REMOVED***/ The CSA "width" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *CSSWidth;

***REMOVED***/ Configuration Settings

***REMOVED***/ The CSA "number" parameter.
@property(nonatomic, assign) NSInteger numberOfAds;

#pragma mark Font

***REMOVED***/ The CSA "fontFamily" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *fontFamily;

***REMOVED***/ The CSA "fontFamilyAttribution" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *attributionFontFamily;

***REMOVED***/ The CSA "fontSizeAnnotation" parameter.
@property(nonatomic, assign) CGFloat annotationFontSize;

***REMOVED***/ The CSA "fontSizeAttribution" parameter.
@property(nonatomic, assign) CGFloat attributionFontSize;

***REMOVED***/ The CSA "fontSizeDescription" parameter.
@property(nonatomic, assign) CGFloat descriptionFontSize;

***REMOVED***/ The CSA "fontSizeDomainLink" parameter.
@property(nonatomic, assign) CGFloat domainLinkFontSize;

***REMOVED***/ The CSA "fontSizeTitle" parameter.
@property(nonatomic, assign) CGFloat titleFontSize;

#pragma mark Color

***REMOVED***/ The CSA "colorAdBorder" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *adBorderColor;

***REMOVED***/ The CSA "colorAdSeparator" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *adSeparatorColor;

***REMOVED***/ The CSA "colorAnnotation" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *annotationTextColor;

***REMOVED***/ The CSA "colorAttribution" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *attributionTextColor;

***REMOVED***/ The CSA "colorBackground" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *backgroundColor;

***REMOVED***/ The CSA "colorBorder" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *borderColor;

***REMOVED***/ The CSA "colorDomainLink" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *domainLinkColor;

***REMOVED***/ The CSA "colorText" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *textColor;

***REMOVED***/ The CSA "colorTitleLink" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *titleLinkColor;

#pragma mark General Formatting

***REMOVED***/ The CSA "adBorderSelections" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *adBorderCSSSelections;

***REMOVED***/ The CSA "adjustableLineHeight" parameter.
@property(nonatomic, assign) CGFloat adjustableLineHeight;

***REMOVED***/ The CSA "attributionSpacingBelow" parameter.
@property(nonatomic, assign) CGFloat attributionBottomSpacing;

***REMOVED***/ The CSA "borderSelections" parameter.
@property(nonatomic, copy, GAD_NULLABLE) NSString *borderCSSSelections;

***REMOVED***/ Indicates if the CSA "noTitleUnderline" parameter is enabled.
@property(nonatomic, assign) BOOL titleUnderlineHidden;

***REMOVED***/ Indicates if the CSA "titleBold" parameter is enabled.
@property(nonatomic, assign) BOOL boldTitleEnabled;

***REMOVED***/ The CSA "verticalSpacing" parameter.
@property(nonatomic, assign) CGFloat verticalSpacing;

#pragma mark Ad Extensions

***REMOVED***/ Indicates if the CSA "detailedAttribution" parameter is enabled.
@property(nonatomic, assign) BOOL detailedAttributionExtensionEnabled;

***REMOVED***/ Indicates if the CSA "longerHeadlines" parameter is enabled.
@property(nonatomic, assign) BOOL longerHeadlinesExtensionEnabled;

***REMOVED***/ Sets an advanced option value for a specified key. The value must be an NSString or NSNumber.
- (void)setAdvancedOptionValue:(id)value forKey:(NSString *)key;

***REMOVED***

GAD_ASSUME_NONNULL_END
