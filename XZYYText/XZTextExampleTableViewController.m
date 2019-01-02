//
//  XZTextExampleTableViewController.m
//  XZYYText
//
//  Created by kkxz on 2018/12/28.
//  Copyright © 2018 kkxz. All rights reserved.
//

#import "XZTextExampleTableViewController.h"
#import <time.h>
#import <YYText/YYText.h>

@interface XZTextExampleTableViewController ()
@property(nonatomic,strong)NSMutableArray *titles;
@property(nonatomic,strong)NSMutableArray *classNames;
@end

@implementation XZTextExampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"YYText";
    self.titles = @[].mutableCopy;
    self.classNames = @[].mutableCopy;
    
    [self addCell:@"TextAttributes" class:@"XZTextAttributeExampleViewController"];
    [self addCell:@"TextTag" class:@"YYTextTagExampleViewController"];
    [self addCell:@"TextAttachment" class:@"XZTextAttachmentExampleViewController"];
    [self addCell:@"CopyPaste" class:@"XZTextCopyPasteExampleViewController"];
}

-(void)addCell:(NSString*)title class:(NSString*)className {
    [self.titles addObject:title];
    [self.classNames addObject:className];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _titles.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"XZCell"];
    if(!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"XZCell"];
    }
    cell.textLabel.text = _titles[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *className = self.classNames[indexPath.row];
    Class class = NSClassFromString(className);
    if(class){
        UIViewController *ctrl = class.new;
        [self.navigationController pushViewController:ctrl animated:YES];
    }
    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
