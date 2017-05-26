***REMOVED***
***REMOVED***  BVTStyles.h
***REMOVED***  burlingtonian
***REMOVED***
***REMOVED***  Created by Greg on 12/30/16.
***REMOVED***  Copyright © 2016 gomez. All rights reserved.
***REMOVED***

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>

#define kBVTCategories @[ @"Arts, Museums, & Music", @"Coffee, Sweets, & Bakeries", @"Hotels, Hostels, Bed & Breakfast", @"Entertainment & Recreation", @"Bars & Lounges", @"Restaurants", @"Shopping", @"Tours & Festivals", @"Travel" ]

***REMOVED*** Categories modeled after those found on https:***REMOVED***www.yelp.com/developers/documentation/v2/category_list
#define kArtsMuseums @[ @"Art Galleries", @"Museums", @"Music Venues", @"Performing Arts" ]

#define kCoffeeSweetsBakeries @[ @"Bakeries", @"Bubble Tea", @"Candy Stores", @"Chocolatiers & Shops", @"Coffee & Tea", @"Coffee Roasteries", @"Desserts", @"Ice Cream & Frozen Yogurt", @"Tea Rooms" ]

***REMOVED***#define kMusic @[ @"Music Venues" ]

#define kHotelsHostelsBB @[ @"Bed & Breakfast",  @"Guest Houses", @"Hostels", @"Hotels", @"Mountain Huts", @"Rest Stops" ]

#define kEntertainmentRecreation @[ @"Airsoft", @"Amusement Parks", @"Aquariums", @"Arcades", @"Archery", @"ATV Rentals/Tours", @"Badminton", @"Baseball Fields", @"Basketball Courts", @"Batting Cages", @"Beaches", @"Beach Equipment Rentals", @"Bike Rentals", @"Bingo Halls", @"Boating", @"Bocce Ball", @"Bowling", @"Boxing", @"Bubble Soccer", @"Bungee Jumping", @"Campgrounds", @"Carouses", @"Casinos", @"Cinema", @"Climbing", @"Country Clubs", @"Cultural Center", @"Cycling Classes", @"Disc Golf", @"Diving", @"Fishing", @"Cardio Classes", @"Dance Studios", @"Farms", @"Go Karts", @"Golf", @"Gun/Rifle Ranges", @"Gyms", @"Gymnastics", @"Hiking", @"Horseback Riding", @"Hot Air Balloons", @"Jet Skis", @"Kids Activities", @"Lakes", @"Martial Arts", @"Medication Centers", @"Mini Golf", @"Mountain Biking", @"Opera & Ballet", @"Paddleboarding", @"Paintball", @"Parks", @"Planetarium", @"Psychics & Astrologers", @"Laser Tag", @"Race Tracks", @"Rafting/Kayaking", @"Recreation Centers", @"Rock Climbing", @"Sailing", @"Ski Resorts", @"Skating Rinks", @"Skydiving", @"Sledding", @"Soccer", @"Social Clubs", @"Stadiums & Arenas", @"Surfing", @"Swimming Pools", @"Tennis", @"Tubing", @"Water Parks", @"Wineries", @"Yoga", @"Ziplining", @"Zoos"]

#define kBarsLounges @[ @"Bars", @"Beer Bar",  @"Beer Gardens", @"Champagne Bars", @"Cocktail Bars", @"Dive Bars", @"Drive-Thru Bars", @"Hookah Bars", @"Irish Pub", @"Lounges", @"Pubs", @"Sports Bars", @"Tiki Bars", @"Vermouth Bars", @"Whiskey Bars", @"Wine Bars" ]

#define kRestaurants @[ @"Afghan", @"African", @"American (New)", @"American (Traditional)", @"Arabian", @"Argentine", @"Armenian", @"Asian Fusion", @"Austrian", @"Bangladeshi", @"Barbeque", @"Basque", @"Belgian", @"Brasseries", @"Brazillian", @"Breakfast & Brunch", @"British", @"Buffets", @"Burgers", @"Burmese", @"Cafes", @"Cajun/Creole", @"Cambodian", @"Caribbean", @"Catalan", @"Cheesesteaks", @"Chinese", @"Creperies", @"Cuban", @"Czech", @"Delis", @"Diners", @"Ethiopian", @"Fast Food", @"French", @"German", @"Greek", @"Guamanian", @"Halal", @"Hawaiian", @"Himalayan/Nepalese", @"Honduran", @"Hong Kong Style Cafe", @"Hungarian", @"Iberian", @"Indian", @"Indonesian", @"Italian", @"Irish", @"Japanese", @"Kebab", @"Korean", @"Kosher", @"Laotian", @"Latin American", @"Live/Raw Food", @"Malaysian", @"Mediterranean", @"Mexican", @"Middle Eastern", @"Modern European", @"Mongolian", @"Moroccan", @"New Mexican Cuisine", @"Nicaraguan", @"Noodles", @"Pakistani", @"Pan Asian", @"Persian/Iranian", @"Peruvian", @"Pizza", @"Polish", @"Portugese", @"Poutineries", @"Russian", @"Salad", @"Sandwiches", @"Scandinavian", @"Scottish", @"Seafood", @"Singaporean", @"Slovakian", @"Soul Food", @"Soup", @"Southern", @"Spanish", @"Sri Lankan", @"Steakhouses", @"Sushi Bars", @"Syrian", @"Taiwanese", @"Tapas Bars", @"Tapas/Small Plates", @"Tex-Mex", @"Thai", @"Turkish", @"Ukranian", @"Uzbek", @"Vegan", @"Vegetarian", @"Vietnamese", @"Waffles", @"Wraps" ]

#define kShopping @[ @"Antiques", @"Appliances", @"Art Supplies", @"Bikes", @"Bookstores", @"Brewing Supplies", @"Bridal", @"Cards & Stationary", @"Children's Clothing", @"Comic Books", @"Computers", @"Cosmetics & Beauty Supply", @"Costumes", @"Department Stores", @"Discount Stores", @"Drugstores", @"Electronics", @"Embroidery & Crochet", @"Eyewear & Opticians", @"Fabric Stores", @"Fitness/Exercise Equipment", @"Flea Markets", @"Florists", @"Formal Wear", @"Framing", @"Furniture Stores", @"Gift Shops", @"Golf Equipment", @"Grilling Equipment", @"Guitar Stores", @"Hardware Stores", @"Hats", @"Hobby Shops", @"Holiday Decorations", @"Home Decor", @"Hot Tub & Pool", @"Hunting & Fishing Supplies", @"Jewelry", @"Kitchen & Bath", @"Knitting Supplies", @"Leather Goods", @"Lingerie", @"Luggage", @"Maternity Wear", @"Mattresses", @"Medical Supplies", @"Men's Clothing", @"Mobile Phones", @"Mobile Phone Accessories", @"Motorcycle Gear", @"Music & DVDs", @"Office Equipment", @"Outdoor Gear", @"Outlet Stores", @"Packing Supplies", @"Paint Stores", @"Pawn Shops", @"Perfume", @"Photography Stores & Services", @"Piano Services", @"Piano Stores", @"Pool & Billiards", @"Rugs", @"Safety Equipment", @"Shoe Stores", @"Shopping Centers", @"Skate Shops", @"Ski & Snowboard Shops", @"Souvenir Shops", @"Spiritual Shop", @"Sports Wear", @"Surf Shop", @"Swim Wear", @"Tabletop Games", @"Tableware", @"Teacher Supplies", @"Thrift Stores", @"Tobacco Shops", @"Toy Stores", @"Vape Shops", @"Vinyl Records", @"Vitamins & Supplements", @"Watches", @"Wholesale Stores" ]

#define kToursFestivals @[ @"Aerial Tours", @"Architectural Tours", @"Art Tours", @"Beer Tours", @"Boat Tours", @"Bus Tours", @"Festivals", @"Food Tours", @"Historical Tours", @"Hot Air Balloons", @"Scooter Tours", @"Walking Tours", @"Whale Watching Tours", @"Wine Tours" ]

#define kTravel @[ @"Airports", @"Airport Shuttles", @"Bike Sharing", @"Bus Stations", @"Cable Cars", @"Car Rental", @"Limos", @"Luggage Storage", @"Metro Stations", @"Motorcycle Rental", @"Passport & Visa Services", @"Pedicabs", @"Private Jet Charter", @"Public Transportation", @"RV Rental", @"Taxis", @"Town Car Service", @"Trains", @"Train Stations", @"Travel Agents", @"Vacation Rentals", @"Vacation Rental Agents", @"Visitor Centers" ]

extern NSString *const star_zero_mini;
extern NSString *const star_one_mini;
extern NSString *const star_one_half_mini;
extern NSString *const star_two_mini;
extern NSString *const star_two_half_mini;
extern NSString *const star_three_mini;
extern NSString *const star_three_half_mini;
extern NSString *const star_four_mini;
extern NSString *const star_four_half_mini;
extern NSString *const star_five_mini;

extern NSString *const star_zero;
extern NSString *const star_one;
extern NSString *const star_one_half;
extern NSString *const star_two;
extern NSString *const star_two_half;
extern NSString *const star_three;
extern NSString *const star_three_half;
extern NSString *const star_four;
extern NSString *const star_four_half;
extern NSString *const star_five;

@interface BVTStyles : NSObject

+ (UIColor *)buttonBackGround;
+ (UIColor *)buttonBorder;
+ (UIColor *)lightGray;
+ (UIColor *)iconGreen;

***REMOVED***
