//
//  XZTextAttributeExampleViewController.m
//  XZYYText
//
//  Created by kkxz on 2018/12/28.
//  Copyright © 2018 kkxz. All rights reserved.
//

#import "XZTextAttributeExampleViewController.h"
#import "UIImage+YYWebImage.h"
#import <YYText/YYText.h>
#import "UIView+YYAdd.h"
#import "NSString+YYAdd.h"

@interface XZTextAttributeExampleViewController ()

@end

@implementation XZTextAttributeExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    __weak typeof (self)_self = self;
    NSMutableAttributedString *text = [[NSMutableAttributedString alloc] init];
   //shadow
    {
        //创建一个属性文本
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Shadow"];
        //为文本设置属性
        one.yy_font =  [UIFont boldSystemFontOfSize:30];
        one.yy_color = [UIColor whiteColor];
        YYTextShadow *shadow = [[YYTextShadow alloc] init];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    //inner shadow
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Inner Shadow"];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
        one.yy_color = [UIColor whiteColor];
        YYTextShadow *shadow = [[YYTextShadow alloc] init];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.40];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 1;
        one.yy_textInnerShadow = shadow;
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    //multiple shadows
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Multiple Shadows"];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
        one.yy_color = [UIColor colorWithRed:1.000 green:0.795 blue:0.014 alpha:1.000];
        
        YYTextShadow *shadow = [[YYTextShadow alloc] init];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.20];
        shadow.offset = CGSizeMake(0, -1);
        shadow.radius = 1.5;
        
        YYTextShadow *subShadow = [[YYTextShadow alloc] init];
        subShadow.color = [UIColor colorWithWhite:1 alpha:0.99];
        subShadow.offset = CGSizeMake(0, 1);
        subShadow.radius = 1.5;
        shadow.subShadow = subShadow;
        one.yy_textInnerShadow = shadow;
        
        YYTextShadow *innerShadow = [[YYTextShadow alloc] init];
        innerShadow.color = [UIColor colorWithRed:0.851 green:0.311 blue:0.000 alpha:0.780];
        innerShadow.offset = CGSizeMake(0, 1);
        innerShadow.radius = 1;
        one.yy_textInnerShadow = innerShadow;
        
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    //background image
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Background Image"];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
        one.yy_color = [UIColor colorWithRed:1.000 green:0.795 blue:0.014 alpha:1.000];
        
        CGSize size = CGSizeMake(20, 20);
        UIImage *background = [UIImage yy_imageWithSize:size drawBlock:^(CGContextRef context) {
            UIColor *c0 = [UIColor colorWithRed:0.054 green:0.879 blue:0.000 alpha:1.000];
            UIColor *c1 = [UIColor colorWithRed:0.869 green:1.000 blue:0.030 alpha:1.000];
            [c0 setFill];
            CGContextFillRect(context, CGRectMake(0, 0, size.width, size.height));
            [c1 setStroke];
            CGContextSetLineWidth(context, 2);
            for(int i=0;i<size.width*2;i+=4){
                CGContextMoveToPoint(context, i, -2);
                CGContextAddLineToPoint(context, i-size.height, size.height +2);
            }
            CGContextStrokePath(context);
        }];
        one.yy_color = [UIColor colorWithPatternImage:background];
        
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    //Border
    {
        NSMutableAttributedString * one = [[NSMutableAttributedString alloc] initWithString:@"Border"];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
        one.yy_color = [UIColor colorWithRed:1.000 green:0.029 blue:0.651 alpha:1.000];
        
        YYTextBorder *border = [[YYTextBorder alloc] init];
        border.strokeColor = [UIColor colorWithRed:1.000 green:0.029 blue:0.651 alpha:1.000];
        border.strokeWidth = 3;
        border.lineStyle = YYTextLineStylePatternCircleDot;
        border.cornerRadius = 3;
        border.insets = UIEdgeInsetsMake(0, -4, 0, -4);
        one.yy_textBackgroundBorder = border;
        
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:[self padding]];
        [text appendAttributedString:[self padding]];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Link"];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
        one.yy_underlineStyle = NSUnderlineStyleSingle;
        one.yy_color = [UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000];
        
        //创建一个“高亮”属性，当用户点击了高亮区域的文本时，“高亮”属性会替代掉原本的属性
        YYTextBorder *border = [[YYTextBorder alloc] init];
        border.cornerRadius = 3;
        border.insets = UIEdgeInsetsMake(-2, -1, -2, -1);
        border.fillColor = [UIColor colorWithWhite:0.000 alpha:0.220];
        
        YYTextHighlight *highlight = [[YYTextHighlight alloc] init];
        [highlight setBorder:border];
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            //你也可以把事件回调放到YYLabel和YYTextView来处理
            [_self showMessage:[NSString stringWithFormat:@"Tap: %@",[text.string substringWithRange:range]]];
        };
        
        //将“高亮”属性设置到某个文本范围
        [one yy_setTextHighlight:highlight range:one.yy_rangeOfAll];
        
        /*
        //可以用一些已经封装好的简便方法来设置文本高亮
        [one yy_setTextHighlightRange:one.yy_rangeOfAll
                                color:[UIColor colorWithRed:0.093 green:0.492 blue:1.000 alpha:1.000]
                      backgroundColor:[UIColor colorWithWhite:0.000 alpha:0.220]
                            tapAction:^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
                                [_self showMessage:[NSString stringWithFormat:@"Tap:%@",[text.string substringWithRange:range]]];
        }];
        */
        
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Another Link"];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
        one.yy_color = [UIColor redColor];
        
        YYTextBorder *border = [[YYTextBorder alloc] init];
        border.cornerRadius = 50;
        border.insets = UIEdgeInsetsMake(0, -10, 0, -10);
        border.strokeWidth = 0.5;
        border.strokeColor = one.yy_color;
        border.lineStyle = YYTextLineStyleSingle;
        one.yy_textBackgroundBorder = border;
        
        YYTextBorder *highlightBorder = border.copy;
        highlightBorder.strokeWidth = 0;
        highlightBorder.strokeColor = one.yy_color;
        highlightBorder.fillColor = one.yy_color;
        
        YYTextHighlight *highlight = [[YYTextHighlight alloc] init];
        [highlight setColor:[UIColor whiteColor]];
        [highlight setBackgroundBorder:highlightBorder];
        highlight.tapAction = ^(UIView * _Nonnull containerView, NSAttributedString * _Nonnull text, NSRange range, CGRect rect) {
            [_self showMessage:[NSString stringWithFormat:@"Tap：%@",[text.string substringWithRange:range]]];
        };
        [one yy_setTextHighlight:highlight range:one.yy_rangeOfAll];
        
        [text appendAttributedString:one];
        [text appendAttributedString:[self padding]];
        
    }
    
    {
        NSMutableAttributedString *one = [[NSMutableAttributedString alloc] initWithString:@"Yet Another Link"];
        one.yy_font = [UIFont boldSystemFontOfSize:30];
        one.yy_color = [UIColor whiteColor];
        
        YYTextShadow *shadow = [[YYTextShadow alloc]init];
        shadow.color = [UIColor colorWithWhite:0.000 alpha:0.490];
        shadow.offset = CGSizeMake(0, 1);
        shadow.radius = 5;
        one.yy_textShadow = shadow;
        
        YYTextShadow *shadow0 = [[YYTextShadow alloc]init];
        shadow0.color = [UIColor colorWithWhite:0.000 alpha:0.20];
        shadow0.offset = CGSizeMake(0, -1);
        shadow0.radius = 1.5;
        YYTextShadow *shadow1 = [[YYTextShadow alloc] init];
        shadow1.color = [UIColor colorWithWhite:1 alpha:0.99];
        shadow1.offset = CGSizeMake(0, 1);
        shadow1.radius = 1.5;
        shadow0.subShadow = shadow1;
        
        YYTextShadow *innerShadow0 = [[YYTextShadow alloc] init];
        innerShadow0.color = [UIColor colorWithRed:0.851 green:0.311 blue:0.000 alpha:0.780];
        innerShadow0.offset = CGSizeMake(0, 1);
        innerShadow0.radius = 1;
        
        YYTextHighlight *highlight = [[YYTextHighlight alloc] init];
        [highlight setColor:[UIColor colorWithRed:1.000 green:0.795 blue:0.014 alpha:1.000]];
        [highlight setShadow:shadow0];
        [highlight setInnerShadow:innerShadow0];
        [one yy_setTextHighlight:highlight range:one.yy_rangeOfAll];
        highlight.tapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
            [_self showMessage:[NSString stringWithFormat:@"Tap: %@",[text.string substringWithRange:range]]];
        };
        
        [text appendAttributedString:one];
        
    }
    
    //属性赋值到YYLabel
    YYLabel *label = [[YYLabel alloc] init];
    label.attributedText = text;
    label.width = self.view.width;
    label.height = self.view.height - (kiOS7Later ? 64 : 44);
    label.top = kiOS7Later ? 64:0;
    label.textAlignment = YYTextVerticalAlignmentCenter;
    label.numberOfLines = 0;
    label.backgroundColor = [UIColor colorWithWhite:0.933 alpha:1.000];
    [self.view addSubview:label];
    
    /*
    label.highlightTapAction = ^(UIView *containerView, NSAttributedString *text, NSRange range, CGRect rect) {
        [_self showMessage:[NSString stringWithFormat:@"Tap: %@",[text.string substringWithRange:range]]];
    };
    */
}

-(NSAttributedString*)padding {
    NSMutableAttributedString *pad = [[NSMutableAttributedString alloc] initWithString:@"\n\n"];
    pad.yy_font = [UIFont systemFontOfSize:4];
    return pad;
}

-(void)showMessage:(NSString*)msg {
    CGFloat padding = 10;
    
    YYLabel *label = [[YYLabel alloc] init];
    label.text = msg;
    label.font = [UIFont systemFontOfSize:16];
    label.textAlignment = NSTextAlignmentCenter;
    label.textColor = [UIColor whiteColor];
    label.backgroundColor = [UIColor colorWithRed:0.033 green:0.685 blue:0.978 alpha:0.730];
    label.width = self.view.width;
    label.textContainerInset = UIEdgeInsetsMake(padding, padding, padding, padding);
    label.height = [msg heightForFont:label.font width:label.width] + 2*padding;
    
    label.bottom = kiOS7Later ? 64 :0;
    [self.view addSubview:label];
    
    [UIView animateWithDuration:0.3 animations:^{
        label.top = kiOS7Later ? 64:0;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.2 delay:2 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            label.bottom = kiOS7Later ? 64:0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
        }];
    }];
}

@end
