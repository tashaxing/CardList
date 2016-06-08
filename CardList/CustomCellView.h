//
//  CustomCellView.h
//  CardList
//
//  Created by yxhe on 16/5/17.
//  Copyright © 2016年 yxhe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomCellView : UITableViewCell

@property (nonatomic, strong) UILabel *cardNumberLabel;
@property (nonatomic,strong) UIImageView *quickPassLogo;

- (void)setTextLabel:(NSString *)cardNumberStr withImage:(UIImage *)img atRow:(NSInteger)row;

@end
