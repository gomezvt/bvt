***REMOVED***
***REMOVED***  YLPClient+Search.m
***REMOVED***  Pods
***REMOVED***
***REMOVED***  Created by David Chen on 1/22/16.
***REMOVED***
***REMOVED***

#import "YLPSearch.h"
#import "YLPClient+Search.h"
#import "YLPCoordinate.h"
#import "YLPQuery.h"
#import "YLPQueryPrivate.h"
#import "YLPResponsePrivate.h"
#import "YLPClientPrivate.h"

@implementation YLPClient (Search)

- (void)searchWithLocation:(NSString *)location
         completionHandler:(YLPSearchCompletionHandler)completionHandler ***REMOVED***
    YLPQuery *query = [[YLPQuery alloc] initWithLocation:location];
    [self searchWithQuery:query completionHandler:completionHandler];
***REMOVED***

- (void)searchWithLocation:(NSString *)location
                      term:(NSString *)term
                     limit:(NSUInteger)limit
                    offset:(NSUInteger)offset
                      sort:(YLPSortType)sort
         completionHandler:(YLPSearchCompletionHandler)completionHandler ***REMOVED***
    YLPQuery *query = [[YLPQuery alloc] initWithLocation:location];
    query.term = term;
    query.limit = limit;
    query.offset = offset;
    query.sort = sort;
    [self searchWithQuery:query completionHandler:completionHandler];
***REMOVED***

- (void)searchWithCoordinate:(YLPCoordinate *)coordinate
                        term:(NSString *)term limit:(NSUInteger)limit
                      offset:(NSUInteger)offset
                        sort:(YLPSortType)sort
           completionHandler:(YLPSearchCompletionHandler)completionHandler ***REMOVED***
    YLPQuery *query = [[YLPQuery alloc] initWithCoordinate:coordinate];
    query.term = term;
    query.limit = limit;
    query.offset = offset;
    query.sort = sort;
    [self searchWithQuery:query completionHandler:completionHandler];
***REMOVED***

- (void)searchWithCoordinate:(YLPCoordinate *)coordinate
           completionHandler:(YLPSearchCompletionHandler)completionHandler ***REMOVED***
    YLPQuery *query = [[YLPQuery alloc] initWithCoordinate:coordinate];
    [self searchWithQuery:query completionHandler:completionHandler];
***REMOVED***

- (NSURLRequest *)searchRequestWithParams:(NSDictionary *)params ***REMOVED***
    return [self requestWithPath:@"/v3/businesses/search" params:params];
***REMOVED***

- (void)searchWithQuery:(YLPQuery *)query
      completionHandler:(YLPSearchCompletionHandler)completionHandler ***REMOVED***
    NSDictionary *params = [query parameters];
    NSURLRequest *req = [self searchRequestWithParams:params];
    
    [self queryWithRequest:req completionHandler:^(NSDictionary *responseDict, NSError *error) ***REMOVED***
        if (error) ***REMOVED***
            completionHandler(nil, error);
        ***REMOVED*** else ***REMOVED***
            YLPSearch *search = [[YLPSearch alloc] initWithDictionary:responseDict];
            completionHandler(search, nil);
        ***REMOVED***
        
    ***REMOVED***];
***REMOVED***

***REMOVED***
