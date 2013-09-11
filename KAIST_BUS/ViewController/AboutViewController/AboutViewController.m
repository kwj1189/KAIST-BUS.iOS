//
//  SettingViewController.m
//  photox
//
//  Created by Include on 13. 8. 7..
//  Copyright (c) 2013년 김원중. All rights reserved.
//

#import "AboutViewController.h"
#import <MessageUI/MFMailComposeViewController.h>

NSString * const titles[] = { @"이용약관", @"문의 및 피드백 메일 보내기"};
#define titleCount (sizeof(titles) / sizeof(titles[0]))

@interface AboutViewController ()

@end

@implementation AboutViewController

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
    self.navigationItem.title = @"설정";
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma table delegate, data source

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSUInteger row = [indexPath row];
    NSUInteger section = [indexPath section];
    
    UINib *nib;
    
    static NSString *CellIdentifier = @"SettingCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] ;
    }
    
    // Configure the cell...
    
    
    cell.textLabel.text = titles[row];
    
    // cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return titleCount;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0;
    NSUInteger row = [indexPath row];
    NSUInteger section = [indexPath section];
    if (section == 0)
        return 70.0;
    else if (section == 1)
        return 50;
    
    
    return 0;
}

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    //NSUInteger section = [indexPath section];
    NSUInteger row = [indexPath row];
    NSString *title = titles[row];
    
    if ([title isEqualToString:@"로그아웃"])
    {
    }
    else if ([title isEqualToString:@"문의 및 피드백 메일 보내기"])
    {
        MFMailComposeViewController* controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        [controller setSubject:@"[문의 및 피드백]"];
        [controller setMessageBody:@"" isHTML:NO];
        [controller setToRecipients:@[@"photox.ios@gmail.com"]];
        [self showLoading];
        [self presentViewController:controller animated:YES completion:^{
            [self hideLoading];
        }];
        
    }
    else if ([title isEqualToString:@"이용약관"])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"준비중입니다" message:@"빠른 시일 내에 준비하겠습니다" delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil, nil];
        [alert show];
    }
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

#pragma  mail delegate

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    if(error)
    {
        NSLog(@"mail send error: %@", error);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"메일 전송 실패" message:@"메일을 전송 중에 문제가 생겼습니다" delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"감사합니다" message:@"메일을 성공적으로 전송했습니다" delegate:nil cancelButtonTitle:@"확인" otherButtonTitles:nil, nil];
        [alert show];
        
    }
    [self dismissViewControllerAnimated:controller completion:^{}];
}


@end