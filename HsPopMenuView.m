//
//  HsPopMenuView.m
//  PopMenuView
//
//  Created by dcpSsss on 16/8/8.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import "HsPopMenuView.h"
#import "HsTableViewDelegate.h"
#import "HsTableViewDataSource.h"
#import "HsTableViewCell.h"
#import "HsPopMenuModel.h"
#import "HsPopMenuSingleton.h"

@interface HsPopMenuView (){
    CGPoint         _startPoint;
    NSInteger       _cellCount;
    CGFloat         _menuWitdh;
    HsTableViewDelegate *_tableDelegate;
    HsTableViewDataSource *_tableDataSource;
}

@end

@implementation HsPopMenuView


- (instancetype) init {
    
    if (self = [super init]) {
        
    }
    return self;
}


-(instancetype)initWithFrame:(CGRect)frame
              menuStartPoint:(CGPoint)startpoint
                   menuWidth:(CGFloat)menuWidth
                       items:(NSArray *)items
                 actionAtRow:(void (^)(NSInteger))action{
    if (self == [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor blackColor]colorWithAlphaComponent:0.1];
        _startPoint         = startpoint;
        _cellCount          = items.count;
        _menuWitdh          = menuWidth;
        
        _tableDelegate =  [[HsTableViewDelegate alloc] initWithDidSelectedAtIndexPath:^(NSInteger indexRow) {
            if (action) {
                action(indexRow);
            }
        }];
        
        _tableDataSource = [[HsTableViewDataSource alloc] initWithItems:items cellClass:[HsTableViewCell class] configureCellBlock:^(HsTableViewCell *cell, HsPopMenuModel *model) {
            HsTableViewCell * tableViewCell = (HsTableViewCell *)cell;
            tableViewCell.textLabel.text = model.title;
            tableViewCell.imageView.image = [UIImage imageNamed:model.image];
        }];
        
        _tableView                      = [[UITableView alloc] initWithFrame:[self menuFrame] style:UITableViewStylePlain];
        _tableView.delegate             = _tableDelegate;
        _tableView.dataSource           = _tableDataSource;
        _tableView.rowHeight            = 40;
        _tableView.layer.cornerRadius   = 10.0f;
        _tableView.transform            = CGAffineTransformMakeScale(0.0001, 0.0001);
        _tableView.scrollEnabled        = NO;
        [self addSubview:_tableView];
        
        if ([_tableView respondsToSelector:@selector(setSeparatorInset:)]) {
            [_tableView setSeparatorInset:UIEdgeInsetsZero];
        }
        if ([_tableView respondsToSelector:@selector(setLayoutMargins:)]) {
            [_tableView setLayoutMargins:UIEdgeInsetsZero];
        }
    }
    return self;
}

- (CGRect)menuFrame{
    CGFloat menuX = _startPoint.x + 25 - _menuWitdh ;
    CGFloat menuY = _startPoint.y + 10 ;
    CGFloat width = _menuWitdh;
    CGFloat heigh = 40 * _cellCount;
    return (CGRect){menuX,menuY,width,heigh};
}

#pragma mark 绘制三角形
- (void)drawRect:(CGRect)rect

{
    // 设置背景色
    [[UIColor whiteColor] set];
    //拿到当前视图准备好的画板
    
    CGContextRef  context = UIGraphicsGetCurrentContext();
    
    //利用path进行绘制三角形
    
    CGContextBeginPath(context);//标记
//    CGFloat location = [UIScreen mainScreen].bounds.size.width - _startPoint.x;
    CGContextMoveToPoint(context,
                         _startPoint.x - 10, _startPoint.y + 10);//设置起点
    
    CGContextAddLineToPoint(context,
                            _startPoint.x ,  _startPoint.y );
    
    CGContextAddLineToPoint(context,
                            _startPoint.x + 10, _startPoint.y + 10);
    
    CGContextClosePath(context);//路径结束标志，不写默认封闭
    
    [[UIColor whiteColor] setFill];  //设置填充色
    
    [[UIColor whiteColor] setStroke]; //设置边框颜色
    
    CGContextDrawPath(context,
                      kCGPathFillStroke);//绘制路径path
    
}

- (void) touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[HsPopMenuSingleton shareInstance] hideMenu];
}

@end
