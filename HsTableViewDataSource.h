//
//  HsTableVIewDataSource.h
//  PopMenuView
//
//  Created by dcpSsss on 16/8/8.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@class HsPopMenuModel,HsTableViewCell;
/**
 * 由model 设置cell 的回调
 */
typedef void(^TableViewCellConfigureBlock) (HsTableViewCell * cell,HsPopMenuModel * model);

@interface HsTableViewDataSource : NSObject<UITableViewDataSource>


/**
 *  创建数据源管理
 *
 *  @param anItems             数据源
 *  @param cellClass           cell 类
 *  @param aConfigureCellBlock 设置cell的回调
 */
- (instancetype) initWithItems:(NSArray *)anItems
                     cellClass:(Class)cellClass
            configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock;

@end
