//
//  HsTableViewDelegate.h
//  PopMenuView
//
//  Created by dcpSsss on 16/8/8.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

/**
 * 点击cell事件回调
 */
typedef void(^TableViewDidSelectRowAtIndexPath)(NSInteger indexRow);

@interface HsTableViewDelegate : NSObject<UITableViewDelegate>

- (instancetype)initWithDidSelectedAtIndexPath:(TableViewDidSelectRowAtIndexPath)tableViewDidSelectRowAtIndexPath;

@end
