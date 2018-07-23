//
//  CategoryViewCell.h
//  item-share-app
//
//  Created by Stephanie Lampotang on 7/20/18.
//  Copyright © 2018 FBU-2018. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CategoryViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *categoryLabel;

- (void) setCategory:(NSString *)keyString;
@end