//
//  SidebarViewController.m
//  photox
//
//  Created by Include on 13. 8. 12..
//  Copyright (c) 2013년 김원중. All rights reserved.
//

#import "SidebarViewController.h"
#import "SidebarCell.h"

@interface SidebarViewController ()

@end

@implementation SidebarViewController
@synthesize cellNibRegistered;

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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    NSUInteger row = [indexPath row];
    NSUInteger section = [indexPath section];
    UINib *nib;
    


    if (!cellNibRegistered)
    {
        nib = [UINib nibWithNibName:@"SidebarCell" bundle:nil];
        [tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
        cellNibRegistered = YES;
    }
    SidebarCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];

    cell.titleLabel.text = @[@"본원↔월평", @"본원↔문지", @"문지↔화암", @"OLEV", @"about"][row];
    
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
        NSObject *object = @[@"홈", @"할일", @"앨범", @"내 캠페인", @"설정"][indexPath.row];
        
        [self.sidebarDelegate sidebarViewController:self didSelectObject:object atIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44.0f;
}

@end
