//
//  HsPopMenuSingleton.h
//  PopMenuView
//
//  Created by dcpSsss on 16/8/8.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HsPopMenuSingleton : NSObject

+ (instancetype)shareInstance;

- (void)showPopMenwViewWithFrame:(CGRect)frame
               menuStartPoint:(CGPoint)startpoint
                    menuWidth:(CGFloat)menuWidth
                        items:(NSArray *)items
                  actionAtRow:(void(^)(NSInteger index))action;

- (void)hideMenu;

@end
