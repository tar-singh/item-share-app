//
//  Booking.m
//  item-share-app
//
//  Created by Nicolas Machado on 7/23/18.
//  Copyright © 2018 FBU-2018. All rights reserved.
//

#import "Booking.h"

@implementation Booking

@dynamic item;
@dynamic seller;
@dynamic renter;
@dynamic address;
@dynamic itemID;
@dynamic startTime;
@dynamic endTime;

+ (nonnull NSString *)parseClassName {
    return @"Booking";
}

//setbooking
+ (void) postBooking: ( Item * )item withSeller:( PFUser * )seller withRenter: ( PFUser * )renter withAddress:( NSString * _Nullable )address withStartTime:(NSDate *)startTime withEndTime:(NSDate *)endTime withCompletion: (PFBooleanResultBlock  _Nullable)completion {
    
    Booking *newBooking = [Booking new];
    newBooking.item = item;
    newBooking.seller = seller;
    newBooking.renter = renter;
    newBooking.address = address;
    newBooking.startTime = startTime;
    newBooking.endTime = endTime;
    
   // [newBooking saveInBackgroundWithBlock: completion];
}
@end
