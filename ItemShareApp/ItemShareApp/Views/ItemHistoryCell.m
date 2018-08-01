//
//  ItemHistoryCell.m
//  item-share-app
//
//  Created by Tarini Singh on 7/30/18.
//  Copyright © 2018 FBU-2018. All rights reserved.
//

#import "ItemHistoryCell.h"

@implementation ItemHistoryCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void) setItem:(Item *)item {
    _item = item;
    self.itemTitle.text = self.item.title;
    self.priceLabel.text = self.item.price;
    self.addressLabel.text = self.item.address;
    self.descriptionLabel.text = self.item.description;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
