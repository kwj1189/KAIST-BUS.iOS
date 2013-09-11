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
@synthesize timeInfo, times, timeTableView;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"toggle_direction.png"] style:UIBarButtonItemStyleBordered target:self action:@selector(toggleDirection:)];
    ;
    //NSLog(@"times: %@", timeInfo);
    times = timeInfo[@"weekday"];
    // Do any additional setup after loading the view from its nib.
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
    
    UINib *nib;
    
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
    times = timeInfo[@"weekday"];
    [timeTableView reloadData];
    
}

- (IBAction)showWeekendTimes:(UIButton *)sender
{
    times = timeInfo[@"weekend"];
    [timeTableView reloadData];
  
}
@end
