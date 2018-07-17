//
//  Item.m
//  ItemShareApp
//
//  Created by Stephanie Lampotang on 7/16/18.
//  Copyright © 2018 Nicolas Machado. All rights reserved.
//

#import "Item.h"

@implementation Item

@dynamic title;
@dynamic owner;
@dynamic location;
@dynamic address;
@dynamic itemID;

+ (nonnull NSString *)parseClassName {
    return @"Item";
}


+ (void) postItem: ( NSString * )title withOwner:( User * )owner withLocation: ( CLLocation * )location withAddress:( NSString * _Nullable )address withCompletion: completion {
    
    Item *newItem = [Item new];
    newItem.title = title;
    newItem.location = location;
    newItem.address = address;
    newItem.owner = owner;
    
    [newItem saveInBackgroundWithBlock: completion];
}

@end
