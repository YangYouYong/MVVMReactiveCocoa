//
//  MRCRepoSettingsOwnerTableViewCell.h
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 15/5/15.
//  Copyright (c) 2015年 leichunfeng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MRCRepoSettingsOwnerTableViewCell : UITableViewCell

@property (nonatomic, weak, readonly) UIImageView *avatarImageView;
@property (nonatomic, weak, readonly) UIButton *avatarButton;
@property (nonatomic, weak, readonly) UILabel *topTextLabel;
@property (nonatomic, weak, readonly) UILabel *bottomTextLabel;

@end
