//
//  HsTableVIewDataSource.m
//  PopMenuView
//
//  Created by dcpSsss on 16/8/8.
//  Copyright © 2016年 dcpSsss. All rights reserved.
//

#import "HsTableVIewDataSource.h"
#import "HsTableViewCell.h"

@interface HsTableViewDataSource()

@property (nonatomic, copy) TableViewCellConfigureBlock configureCellBlock;
@property (nonatomic, strong) Class Cellclass;
@property (nonatomic, strong) NSArray * modelArray;

@end

@implementation HsTableViewDataSource


- (instancetype) init {
    
    if (self = [super init]) {
        self.modelArray = [NSArray array];
    }
    return self;
}

- (instancetype) initWithItems:(NSArray *)anItems
                     cellClass:(Class)cellClass
            configureCellBlock:(TableViewCellConfigureBlock)aConfigureCellBlock {
    
    if (self = [super init]) {
        
        self.modelArray = anItems;
        self.configureCellBlock = [aConfigureCellBlock copy];
        self.Cellclass = cellClass;
    }
    return self;
}



- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger number = self.modelArray.count;
    return number;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HsTableViewCell * cell = [[self.Cellclass class] cellAllocWithTableView:tableView];
    self.configureCellBlock(cell,self.modelArray[indexPath.row]);
    return cell;
}

@end
