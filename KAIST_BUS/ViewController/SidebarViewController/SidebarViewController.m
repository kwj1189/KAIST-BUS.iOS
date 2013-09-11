//
//  SidebarViewController.m
//  photox
//
//  Created by Include on 13. 8. 12..
//  Copyright (c) 2013년 김원중. All rights reserved.
//

#import "SidebarViewController.h"
#import "SidebarCell.h"
#import "UINavigationItem+JTRevealSidebarV2.h"
#import "UIViewController+JTRevealSidebarV2.h"
#import "TimetableViewController.h"

NSString * const sidebarTitles[] = {@"본원 문지", @"문지 화암", @"화암 본원", @"본원 월평", @"교내순환 OLEV", @"about"};
#define sidebarTitleCount (sizeof(sidebarTitles) / sizeof(sidebarTitles[0]))



@interface SidebarViewController ()

@end

@implementation SidebarViewController
@synthesize cellNibRegistered, tableView, currentIndexPath, sidebarDelegate;

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
    // Do any additional setup after loading the view from its nib.
    [self.tableView selectRowAtIndexPath:self.sidebarDelegate.sidebarIndexPath animated:NO scrollPosition:UITableViewScrollPositionNone];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return sidebarTitleCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NSUInteger row = [indexPath row];
    //NSUInteger section = [indexPath section];
    UINib *nib;
    


    if (!cellNibRegistered)
    {
        nib = [UINib nibWithNibName:@"SidebarCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        cellNibRegistered = YES;
    }
    SidebarCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    cell.titleLabel.text = sidebarTitles[indexPath.row];
    //cell.iconImageView.image = [UIImage imageNamed:[SidebarViewController sidebarIcons][indexPath.row]];
    return cell;
}
/*
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
  
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.sidebarDelegate) {
        NSObject *object = sidebarTitles[indexPath.row];
        NSUInteger row = indexPath.row;
        NSString *title;
        NSArray *times;
        
        TimetableViewController *timetable = [[TimetableViewController alloc] initWithNibName:@"TimetableViewController" bundle:nil];
        if (row == 0)
        {
            times = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"BonwonMunji" ofType:@"plist"]];
            title = @"본원 → 문지";
        }
        timetable.timeInfo = times;
        timetable.title = title;
        [self.sidebarDelegate sidebarViewController:self didSelectObject:timetable atIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

- (IBAction)closeSidebar:(UISwipeGestureRecognizer *)sender
{
    [sidebarDelegate closeSidebarViewController:self];
   // [self.navigationController setRevealedState:JTRevealedStateNo];
    //self.sidebarDelegate.view.userInteractionEnabled = YES;
}


+ (NSArray *)sidebarIcons
{
    return @[@"sidebar_main.png", @"sidebar_todo.png", @"sidebar_album.png", @"sidebar_campaign.png", @"sidebar_setting.png", @"sidebar_statistic.png"];
}
@end
