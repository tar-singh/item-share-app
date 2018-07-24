//
//  CatAndItemTableViewController.h
//  item-share-app
//
//  Created by Stephanie Lampotang on 7/20/18.
//  Copyright © 2018 FBU-2018. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CatAndItemTableViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITableView *catAndItemTableView;
@property (strong, nonatomic) NSMutableArray *itemRows;
@property (strong, nonatomic) NSMutableArray *categoryRows;

@end