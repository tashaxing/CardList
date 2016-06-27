//
//  CustomCellView.h
//  CardList
//
//  Created by yxhe on 16/5/17.
//  Copyright © 2016年 yxhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UPCustomCellView : UITableViewCell

@property (nonatomic, strong) UILabel *cardNumberLabel;   //card number
@property (nonatomic,strong) UIImageView *quickPassLogo;  //logo

//set the label contents, called outside
- (void)setTextLabel:(NSString *)cardNumberStr withImage:(UIImage *)img atRow:(NSInteger)row;

@end
