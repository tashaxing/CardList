//
//  CustomCellView.m
//  CardList
//
//  Created by yxhe on 16/5/17.
//  Copyright © 2016年 yxhe. All rights reserved.
//

#import "UPCustomCellView.h"

#define LOGO_WIDTH 152
#define LOGO_HEIGHT 58

@interface UPCustomCellView ()

@end

@implementation UPCustomCellView
#pragma mark - cellview delegate
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    //custom the cell style
    if (self)
    {
        //add textlabel
        self.cardNumberLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.frame.size.height/2)];
        
        [self.contentView addSubview:self.cardNumberLabel];
        
        //add image logo
        self.quickPassLogo = [[UIImageView alloc] initWithFrame:CGRectMake(self.contentView.frame.size.width - LOGO_WIDTH, 0, LOGO_WIDTH, LOGO_HEIGHT)];
        
        [self.contentView addSubview:self.quickPassLogo];
        
    }
    
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];
}

#pragma mark - called by other objects
//custom the cell string logo and row color
- (void)setTextLabel:(NSString *)cardNumberStr withImage:(UIImage *)img atRow:(NSInteger)row
{
    self.cardNumberLabel.text = cardNumberStr;
    self.quickPassLogo.image = img;
    //set background color for each line
    self.contentView.backgroundColor = row%2 ? [UIColor greenColor]:[UIColor yellowColor];
}

@end
