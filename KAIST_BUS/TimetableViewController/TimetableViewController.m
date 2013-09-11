//
//  TimetableViewController.m
//  KAIST_BUS
//
//  Created by 김원중 on 13. 9. 12..
//  Copyright (c) 2013년 Kim Won Jung. All rights reserved.
//

#import "TimetableViewController.h"

@interface TimetableViewController ()

@end

@implementation TimetableViewController
@synthesize timeInfo, times, timeTableView, timeInfos, isWeekday;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (NSString *)dateKey
{
    return isWeekday ? @"weekday" : @"weekend";
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    if([timeInfos count] > 1)
    {
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"toggle_direction.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(toggleDirection)];
    
    }
    isWeekday = YES;
    
    timeInfo = timeInfos[0];
    self.navigationItem.title = timeInfo[@"title"];
    //NSLog(@"times: %@", timeInfo);
    times = timeInfo[[self dateKey]];
    // Do any additional setup after loading the view from its nib.
}

- (void)toggleDirection
{
    if(timeInfo == timeInfos[0])
        timeInfo = timeInfos[1];
    else
        timeInfo = timeInfos[0];
    
    
    self.navigationItem.title = timeInfo[@"title"];
    times = timeInfo[[self dateKey]];
    [timeTableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma collection view
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSUInteger row = [indexPath row];
    NSUInteger section = [indexPath section];
    static NSString *CellIdentifier = @"TimetableCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    // Configure the cell...
    
    
    cell.textLabel.text = times[row];
    
    // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [times count];
}
- (IBAction)showWeekdayTimes:(UIButton *)sender
{
    isWeekday = YES;
    times = timeInfo[@"weekday"];
    [timeTableView reloadData];
    
}

- (IBAction)showWeekendTimes:(UIButton *)sender
{
    isWeekday = NO;
    times = timeInfo[@"weekend"];
    [timeTableView reloadData];
  
}
@end
