//
//  MRCOwnedReposViewController.m
//  MVVMReactiveCocoa
//
//  Created by leichunfeng on 15/1/18.
//  Copyright (c) 2015年 leichunfeng. All rights reserved.
//

#import "MRCOwnedReposViewController.h"
#import "MRCOwnedReposViewModel.h"
#import "MRCReposTableViewCell.h"

@interface MRCOwnedReposViewController ()

@property (strong, nonatomic, readonly) MRCOwnedReposViewModel *viewModel;

@end

@implementation MRCOwnedReposViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 78;
    
    [self.tableView registerNib:[UINib nibWithNibName:@"MRCReposTableViewCell" bundle:nil] forCellReuseIdentifier:@"MRCReposTableViewCell"];
    
    @weakify(self)
    [self.viewModel.requestRemoteDataCommand.executing subscribeNext:^(NSNumber *executing) {
        @strongify(self)
        if (executing.boolValue) {
            if ([self.viewModel.dataSource.firstObject count] == 0) {
                [MBProgressHUD showHUDAddedTo:self.view animated:YES].labelText = MBPROGRESSHUD_LABEL_TEXT;
            }
        } else {
            [MBProgressHUD hideHUDForView:self.view animated:YES];
        }
    }];
}

#pragma mark - UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MRCReposTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MRCReposTableViewCell"];
    cell.descriptionLabel.numberOfLines = 3;
    [cell bindViewModel:self.viewModel.dataSource[indexPath.section][indexPath.row]];
    return cell;
}

@end