//
//  HsPopMenuView.h
//  PopMenuView
//
//  Created by dcpSsss on 16/8/8.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HsPopMenuView : UIView

@property(nonatomic,strong)UITableView *tableView;

- (instancetype)initWithFrame:(CGRect)frame
               menuStartPoint:(CGPoint)startpoint
                    menuWidth:(CGFloat)menuWidth
                        items:(NSArray *)items
                  actionAtRow:(void(^)(NSInteger index))action;

@end
