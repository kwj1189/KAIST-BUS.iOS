//
//  TimetableViewController.h
//  KAIST_BUS
//
//  Created by 김원중 on 13. 9. 12..
//  Copyright (c) 2013년 Kim Won Jung. All rights reserved.
//

#import "RootViewControllerBase.h"

@interface TimetableViewController : RootViewControllerBase<UITableViewDataSource, UITableViewDelegate>
- (IBAction)showWeekdayTimes:(UIButton *)sender;

- (IBAction)showWeekendTimes:(UIButton *)sender;
@property (strong, nonatomic) NSDictionary *timeInfo;
@property (strong, nonatomic) IBOutlet UITableView *timeTableView;
@property (strong, nonatomic) NSArray *times;
@property (strong, nonatomic) NSArray *timeInfos;
@property (assign, nonatomic) BOOL isWeekday;
@end
