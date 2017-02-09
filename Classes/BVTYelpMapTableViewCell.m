***REMOVED***
***REMOVED***  BVTYelpMapTableViewCell.m
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/30/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import "BVTYelpMapTableViewCell.h"
#import <MapKit/MapKit.h>
#import "YLPLocation.h"
#import "YLPCoordinate.h"

@interface BVTYelpMapTableViewCell ()

@property (nonatomic, weak) IBOutlet MKMapView *mapView;

***REMOVED***

@implementation BVTYelpMapTableViewCell

- (void)awakeFromNib ***REMOVED***
    [super awakeFromNib];
    ***REMOVED*** Initialization code
***REMOVED***

- (void)setSelected:(BOOL)selected animated:(BOOL)animated ***REMOVED***
    [super setSelected:selected animated:animated];

    ***REMOVED*** Configure the view for the selected state
***REMOVED***

- (void)setSelectedBusiness:(YLPBusiness *)selectedBusiness
***REMOVED***
    _selectedBusiness = selectedBusiness;
    
    CLLocationCoordinate2D location;
    location.latitude = self.selectedBusiness.location.coordinate.latitude;
    location.longitude = self.selectedBusiness.location.coordinate.longitude;
    
    MKCoordinateRegion region;
    MKCoordinateSpan span;
    span.latitudeDelta = 0.001;
    span.longitudeDelta = 0.001;
    
    region.span = span;
    region.center = location;
    [self.mapView setRegion:region animated:YES];
    
    MKPointAnnotation *annotationPoint = [[MKPointAnnotation alloc] init];
    annotationPoint.coordinate = location;
    annotationPoint.title = self.selectedBusiness.name;
    [self.mapView addAnnotation:annotationPoint];

***REMOVED***

***REMOVED***
