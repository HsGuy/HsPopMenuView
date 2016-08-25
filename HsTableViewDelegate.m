//
//  HsTableViewDelegate.m
//  PopMenuView
//
//  Created by dcpSsss on 16/8/8.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import "HsTableViewDelegate.h"

@interface HsTableViewDelegate(){
    TableViewDidSelectRowAtIndexPath _didSelectedRowAtIndexPathCallback;
}

@end

@implementation HsTableViewDelegate

- (instancetype)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

-(instancetype)initWithDidSelectedAtIndexPath:(TableViewDidSelectRowAtIndexPath)tableViewDidSelectRowAtIndexPath{
    self = [super init];
    
    if (self) {
        _didSelectedRowAtIndexPathCallback = [tableViewDidSelectRowAtIndexPath copy];
    }
    return self;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 40;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (_didSelectedRowAtIndexPathCallback) {
        _didSelectedRowAtIndexPathCallback(indexPath.row);
    }
}

@end
