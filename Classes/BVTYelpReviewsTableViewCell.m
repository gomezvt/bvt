//
//  BVTYelpReviewsTableViewCell.m
//  bvt
//
//  Created by Greg on 2/16/17.
//  Copyright © 2017 gms. All rights reserved.
//

#import "BVTYelpReviewsTableViewCell.h"

@implementation BVTYelpReviewsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    
    self.reviewLabel.text = nil;
    self.dateLabel.text = nil;
    self.ratingView.image = nil;
    self.userImageView.image = nil;
}

@end
