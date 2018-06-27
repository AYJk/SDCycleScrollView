//
//  SDCollectionViewCell.m
//  SDCycleScrollView
//
//  Created by aier on 15-3-22.
//  Copyright (c) 2015年 GSD. All rights reserved.
//


/*
 
 *********************************************************************************
 *
 * 🌟🌟🌟 新建SDCycleScrollView交流QQ群：185534916 🌟🌟🌟
 *
 * 在您使用此自动轮播库的过程中如果出现bug请及时以以下任意一种方式联系我们，我们会及时修复bug并
 * 帮您解决问题。
 * 新浪微博:GSD_iOS
 * Email : gsdios@126.com
 * GitHub: https://github.com/gsdios
 *
 * 另（我的自动布局库SDAutoLayout）：
 *  一行代码搞定自动布局！支持Cell和Tableview高度自适应，Label和ScrollView内容自适应，致力于
 *  做最简单易用的AutoLayout库。
 * 视频教程：http://www.letv.com/ptv/vplay/24038772.html
 * 用法示例：https://github.com/gsdios/SDAutoLayout/blob/master/README.md
 * GitHub：https://github.com/gsdios/SDAutoLayout
 *********************************************************************************
 
 */


#import "SDCollectionViewCell.h"
#import "UIView+SDExtension.h"

@implementation SDCollectionViewCell
{
    __weak UILabel *_titleLabel;
    __weak UILabel *_subTitleLabel;
}


- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self setupImageView];
        [self setupTitleLabel];
        [self setupSubTitleLabel];
    }
    
    return self;
}

- (void)setTitleLabelBackgroundColor:(UIColor *)titleLabelBackgroundColor
{
    _titleLabelBackgroundColor = titleLabelBackgroundColor;
    _titleLabel.backgroundColor = titleLabelBackgroundColor;
}

- (void)setSubTitleLabelBackgroundColor:(UIColor *)subTitleLabelBackgroundColor {
    _subTitleLabelBackgroundColor = subTitleLabelBackgroundColor;
    _subTitleLabel.backgroundColor = subTitleLabelBackgroundColor;
}

- (void)setTitleLabelTextColor:(UIColor *)titleLabelTextColor
{
    _titleLabelTextColor = titleLabelTextColor;
    _titleLabel.textColor = titleLabelTextColor;
}

- (void)setSubTitleLabelTextColor:(UIColor *)subTitleLabelTextColor {
    _subTitleLabelTextColor = subTitleLabelTextColor;
    _subTitleLabel.textColor = subTitleLabelTextColor;
}

- (void)setTitleLabelTextFont:(UIFont *)titleLabelTextFont
{
    _titleLabelTextFont = titleLabelTextFont;
    _titleLabel.font = titleLabelTextFont;
}

- (void)setSubTitleLabelTextFont:(UIFont *)subTitleLabelTextFont
{
    _subTitleLabelTextFont = subTitleLabelTextFont;
    _subTitleLabel.font = subTitleLabelTextFont;
}

- (void)setupImageView
{
    UIImageView *imageView = [[UIImageView alloc] init];
    _imageView = imageView;
    [self.contentView addSubview:imageView];
}

- (void)setupTitleLabel
{
    UILabel *titleLabel = [[UILabel alloc] init];
    _titleLabel = titleLabel;
    _titleLabel.hidden = YES;
    [self.contentView addSubview:titleLabel];
}

- (void)setupSubTitleLabel {
    UILabel *subTitleLabel = [[UILabel alloc] init];
    _subTitleLabel = subTitleLabel;
    _subTitleLabel.hidden = YES;
    [self.contentView addSubview:subTitleLabel];
}

- (void)setTitle:(NSString *)title
{
    _title = [title copy];
    _titleLabel.text = [NSString stringWithFormat:@"   %@", title];
    if (_titleLabel.hidden) {
        _titleLabel.hidden = NO;
    }
}

- (void)setSubTitle:(NSString *)subTitle {
    _subTitle = [subTitle copy];
    _subTitleLabel.text = [NSString stringWithFormat:@"%@", subTitle];
    if (_subTitleLabel.hidden) {
        _subTitleLabel.hidden = NO;
    }
}

-(void)setTitleLabelTextAlignment:(NSTextAlignment)titleLabelTextAlignment
{
    _titleLabelTextAlignment = titleLabelTextAlignment;
    _titleLabel.textAlignment = titleLabelTextAlignment;
}

- (void)setSubTitleLabelTextAlignment:(NSTextAlignment)subTitleLabelTextAlignment {
    _subTitleLabelTextAlignment = subTitleLabelTextAlignment;
    _subTitleLabel.textAlignment = subTitleLabelTextAlignment;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.onlyDisplayText) {
        if (self.isShowSubTitle) {
            _subTitleLabel.frame = CGRectMake(self.bounds.size.width - _subTitleLabelWidth, 0, _subTitleLabelWidth, self.bounds.size.height);
            _titleLabel.frame = CGRectMake(0, 0, self.bounds.size.width - _subTitleLabelWidth, self.bounds.size.height);
        } else {
            _titleLabel.frame = self.bounds;
        }
    } else {
        _imageView.frame = self.bounds;
        CGFloat titleLabelW = self.sd_width;
        CGFloat titleLabelH = _titleLabelHeight;
        CGFloat titleLabelX = 0;
        CGFloat titleLabelY = self.sd_height - titleLabelH;
        _titleLabel.frame = CGRectMake(titleLabelX, titleLabelY, titleLabelW, titleLabelH);
    }
}

@end

