//
//  HsPopMenuSingleton.m
//  PopMenuView
//
//  Created by dcpSsss on 16/8/8.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import "HsPopMenuSingleton.h"
#import "HsPopMenuView.h"

@interface HsPopMenuSingleton()
@property(nonatomic,strong)HsPopMenuView *popMenuView;
@end

@implementation HsPopMenuSingleton

+ (instancetype)shareInstance{
    static HsPopMenuSingleton *shareInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        shareInstance = [[HsPopMenuSingleton alloc] init];
    });
    return shareInstance;
}

-(void)showPopMenwViewWithFrame:(CGRect)frame
                menuStartPoint:(CGPoint)startpoint
                      menuWidth:(CGFloat)menuWidth
                          items:(NSArray *)items
                    actionAtRow:(void (^)(NSInteger))action{
    __weak __typeof(&*self)weakSelf = self;
    if (self.popMenuView != nil) {
        [weakSelf hideMenu];
    }
    UIWindow *window = [UIApplication sharedApplication].windows.firstObject;
    self.popMenuView = [[HsPopMenuView alloc] initWithFrame:[UIScreen mainScreen].bounds menuStartPoint:startpoint menuWidth:menuWidth items:items actionAtRow:^(NSInteger index) {
        if (action) {
            action(index);
        }
    }];
    [self.popMenuView setBackgroundColor:[[UIColor blackColor] colorWithAlphaComponent:0.1f]];
    [window addSubview:self.popMenuView];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.popMenuView.tableView.transform = CGAffineTransformMakeScale(1.0, 1.0);
    }];
}

- (void) hideMenu {
    [UIView animateWithDuration:0.3 animations:^{
        self.popMenuView.tableView.transform = CGAffineTransformMakeScale(0.0001, 0.0001);
    } completion:^(BOOL finished) {
        [self.popMenuView.tableView removeFromSuperview];
        [self.popMenuView removeFromSuperview];
        self.popMenuView.tableView = nil;
        self.popMenuView = nil;
    }];
}

@end
