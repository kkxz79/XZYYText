//
//  XZTextCopyPasteExampleViewController.m
//  XZYYText
//
//  Created by kkxz on 2019/1/2.
//  Copyright © 2019 kkxz. All rights reserved.
//

#import "XZTextCopyPasteExampleViewController.h"
#import "YYText.h"
#import "YYImage.h"
#import "UIImage+YYWebImage.h"
#import "UIView+YYAdd.h"
#import "NSBundle+YYAdd.h"
#import "NSString+YYAdd.h"

@interface XZTextCopyPasteExampleViewController ()<YYTextViewDelegate>
@property(nonatomic,assign)YYTextView *textView;
@end

@implementation XZTextCopyPasteExampleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    if([self respondsToSelector:@selector(setAutomaticallyAdjustsScrollViewInsets:)]) {
        self.automaticallyAdjustsScrollViewInsets = NO;
    }
    
    NSString *text = @"You can copy image from browser or photo album and paste it to here. It support animated GIF and APNG. \n\nYou can also copy attributed string from other YYTextView.\n";
    YYTextSimpleMarkdownParser *parser = [[YYTextSimpleMarkdownParser alloc] init];
    [parser setColorWithDarkTheme];
    
    YYTextView *textView = [[YYTextView alloc] init];
    textView.text = text;
    textView.font = [UIFont systemFontOfSize:17];
    textView.size = self.view.size;
    textView.textContainerInset = UIEdgeInsetsMake(10, 10, 10, 10);
    textView.delegate = self;
    textView.allowsPasteImage = YES;///paste image
    textView.allowsPasteAttributedString = YES;///paste attributed string
    
    if(kiOS7Later){
        textView.keyboardDismissMode = UIScrollViewKeyboardDismissModeInteractive;
    }
    textView.contentInset = UIEdgeInsetsMake(64, 0, 0, 0);
    textView.scrollIndicatorInsets = textView.contentInset;
    [self.view addSubview:textView];
    self.textView = textView;
    
    textView.selectedRange = NSMakeRange(text.length, 0);
    [textView becomeFirstResponder];
}

- (void)edit:(UIBarButtonItem *)item {
    if(_textView.isFirstResponder){
        [_textView resignFirstResponder];
    } else {
        [_textView becomeFirstResponder];
    }
}

-(void)textViewDidBeginEditing:(YYTextView *)textView {
    UIBarButtonItem *buttonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                                target:self
                                                                                action:@selector(edit:)];
    self.navigationItem.rightBarButtonItem = buttonItem;
}

-(void)textViewDidEndEditing:(YYTextView *)textView {
    self.navigationItem.rightBarButtonItem = nil;
}

@end
