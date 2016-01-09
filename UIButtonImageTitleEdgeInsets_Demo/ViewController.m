//
//  ViewController.m
//  UIButtonImageTitleEdgeInsets_Demo
//
//  Created by lcy on 16/1/9.
//  Copyright © 2016年 lcy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *oneButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneButtonHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *oneButtonWidth;

@property (weak, nonatomic) IBOutlet UIButton *twoButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twoButtonHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *twoButtonWidth;

@property (weak, nonatomic) IBOutlet UIButton *threeButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *threeButtonHeight;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *threeButtonWidth;

@property (weak, nonatomic) IBOutlet UIButton *fourButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fourButtonWidth;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *fourButtonHeight;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     默认情况下
     1，imageEdgeInsets和titleEdgeInsets都是0。
     2，imageView在前，label在后，中间没有空隙。
     if (button.width小于imageView上image的width){图像会被压缩，文字不显示}
     if (button.width < imageView.width + label.width){图像正常显示，文字显示不全}
     if (button.width >＝ imageView.width + label.width){图像和文字都居中显示，imageView在左，label在右，中间没有空隙}
     */
    
    //图片在左文字在右
    [self setupToLeftImageRightTitle];
    
    //图片在右文字在左
    [self setupToLeftTitleRightImage];
    
    //图片在上文字在下
    [self setupToTopImageBottomTitle];
    
    //图片在下文字在上
    [self setupToTopTitleBottomImage];
}

#pragma mark --  图片在左文字在右 --
- (void)setupToLeftImageRightTitle
{
    NSString *title = @"粉色";
    CGFloat titleFont = 14;
    CGFloat titleHeight = titleFont;
    CGFloat titleWidth = [self widthWithText:title forFontSize:titleFont andHeight:titleHeight];
    
    CGFloat imageWidth = 20;
    CGFloat imageHeight = 20;
    
    CGFloat space = 10;
    CGFloat leftEdge = 10;
    CGFloat rightEdge = 10;
    
    CGFloat buttonWidth = space + leftEdge + rightEdge + imageWidth + titleWidth;
    CGFloat buttonHeight = imageHeight;
    
    [self setupColorOfButton:self.oneButton];
    self.oneButtonWidth.constant = buttonWidth;
    self.oneButton.imageEdgeInsets = UIEdgeInsetsMake((buttonHeight - imageHeight) / 2, leftEdge, (buttonHeight - imageHeight) / 2, buttonWidth - leftEdge - imageWidth);
    self.oneButton.titleEdgeInsets = UIEdgeInsetsMake((buttonHeight - titleHeight) / 2, leftEdge + space, (buttonHeight - titleHeight) / 2, rightEdge);
}

#pragma mark -- 图片在右文字在左 --
- (void)setupToLeftTitleRightImage
{
    NSString *title = @"粉色";
    CGFloat titleFont = 14;
    CGFloat titleHeight = titleFont;
    CGFloat titleWidth = [self widthWithText:title forFontSize:titleFont andHeight:titleFont];
    
    CGFloat imageWidth = 20;
    CGFloat imageHeight = 20;
    
    CGFloat space = 10;
    CGFloat leftEdge = 10;
    CGFloat rightEdge = 10;
    
    CGFloat buttonWidth = space + leftEdge + rightEdge + imageWidth + titleWidth;
    CGFloat buttonHeight = imageHeight;
    
    [self setupColorOfButton:self.twoButton];
    self.twoButtonWidth.constant = buttonWidth;
    
    self.twoButton.imageEdgeInsets = UIEdgeInsetsMake((buttonHeight - imageHeight) / 2, buttonWidth - imageWidth - rightEdge, (buttonHeight - imageHeight) / 2,rightEdge - titleWidth);
    
    self.twoButton.titleEdgeInsets = UIEdgeInsetsMake((buttonHeight - titleHeight) / 2, leftEdge - imageWidth, (buttonHeight - titleHeight) / 2, buttonWidth - space - imageWidth - rightEdge);
    
    //解释这段代码之前再强调一下UIButton控件的默认布局：imageView在左，label在右，中间没有空隙。
    
    /*
     imageView的设置
     imageView的左侧与button的左边界距离:button的width，去掉右侧留出的rightEdge，再去掉imageView的width.
     imageView的右侧与button的右边界距离:想像imageView后面还接着有一个label，那么label的右侧与button的右边界距离为rightEdge - titleWidth.
     
     label的设置
     label的右侧与button右边界的距离:button的width，去掉左侧留出的rightEdge，再去掉imageView的width，再去掉空隙space.
     label的左侧与button左边届的距离:想象label的左侧还有一个imageView，那么这个整体离button左边界的距离为leftEdge - imageWidth。
     
     以上只考虑了width方向，height方向与width是独立的，比width更容易一些。
     */
}

#pragma mark -- 图片在下文字在上 --
- (void)setupToTopImageBottomTitle {
    
    NSString *title = @"粉色";
    CGFloat titleFont = 14;
    CGFloat titleHeight = titleFont;
    CGFloat titleWidth = [self widthWithText:title forFontSize:titleFont andHeight:titleFont];
    
    CGFloat imageWidth = 20;
    CGFloat imageHeight = 20;
    
    CGFloat space = 10;
    CGFloat topEdge = 10;
    CGFloat bottomEdge = 10;
    
    CGFloat buttonWidth = titleWidth + 20;
    CGFloat buttonHeight = space + titleHeight + imageHeight + topEdge + bottomEdge;
    
    [self setupColorOfButton:self.threeButton];
    self.threeButtonWidth.constant = buttonWidth;
    self.threeButtonHeight.constant = buttonHeight;
    
    self.threeButton.imageEdgeInsets = UIEdgeInsetsMake(topEdge + titleHeight + space, (buttonWidth - imageWidth) / 2, bottomEdge,(buttonWidth - imageWidth) / 2 - titleWidth);
    
    self.threeButton.titleEdgeInsets = UIEdgeInsetsMake(topEdge,(buttonWidth - titleWidth) / 2 - imageWidth,space + bottomEdge + imageHeight,(buttonWidth - titleWidth) / 2);
}

#pragma mark -- 图片在上文字在下 --
- (void)setupToTopTitleBottomImage {
    
    NSString *title = @"粉色";
    CGFloat titleFont = 14;
    CGFloat titleHeight = titleFont;
    CGFloat titleWidth = [self widthWithText:title forFontSize:titleFont andHeight:titleFont];
    
    CGFloat imageWidth = 20;
    CGFloat imageHeight = 20;
    
    CGFloat space = 10;
    CGFloat topEdge = 10;
    CGFloat bottomEdge = 10;
    
    CGFloat buttonWidth = titleWidth + 20;
    CGFloat buttonHeight = space + titleHeight + imageHeight + topEdge + bottomEdge;
    
    [self setupColorOfButton:self.fourButton];
    self.fourButtonWidth.constant = buttonWidth;
    self.fourButtonHeight.constant = buttonHeight;
    
    self.fourButton.imageEdgeInsets = UIEdgeInsetsMake(topEdge, (buttonWidth - imageWidth) / 2, space + titleHeight + bottomEdge,(buttonWidth - imageWidth) / 2 - titleWidth);
    
    self.fourButton.titleEdgeInsets = UIEdgeInsetsMake(imageHeight + 10 + topEdge,(buttonWidth - titleWidth) / 2 - imageWidth,bottomEdge,(buttonWidth - titleWidth) / 2);
}

- (CGFloat)widthWithText:(NSString *)text forFontSize:(float)fontSize andHeight:(float)height {
    
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont systemFontOfSize:fontSize]};
    return [text boundingRectWithSize:CGSizeMake(MAXFLOAT, height) options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size.width;
}

- (void)setupColorOfButton:(UIButton *)button
{
    button.titleLabel.backgroundColor = [UIColor redColor];
    button.imageView.backgroundColor = [UIColor blueColor];
}

@end
