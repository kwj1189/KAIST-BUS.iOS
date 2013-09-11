//
//  RootViewControllerBase.m
//  photox
//
//  Created by Include on 13. 8. 12..
//  Copyright (c) 2013년 김원중. All rights reserved.
//

#import "RootViewControllerBase.h"
#import <QuartzCore/QuartzCore.h>
#import "UINavigationItem+JTRevealSidebarV2.h"
#import "UIViewController+JTRevealSidebarV2.h"
#import "TimetableViewController.h"

@interface RootViewControllerBase ()

@end

@implementation RootViewControllerBase
@synthesize loadingView;

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
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"ButtonMenu.png"]  style:UIBarButtonItemStyleBordered target:self action:@selector(revealLeftSidebar)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor grayColor];
    /*
    UIBarButtonItem *barButton = [UIBarButtonItem alloc] initWithImage:<#(UIImage *)#> landscapeImagePhone:<#(UIImage *)#> style:<#(UIBarButtonItemStyle)#> target:<#(id)#> action:<#(SEL)#>]
 barButton.
    UIButton *sidebarButton = [UIButton buttonWithType:UIButtonTypeCustom];
    sidebarButton.backgroundColor = [UIColor blackColor];
    [sidebarButton addTarget:self action:@selector(revealLeftSidebar) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:sidebarButton];
    */
   // [sidebarButton setBackgroundImage:[UIImage imageNamed:@"ButtonMenu.png"] forState:UIControlStateNormal];

    

    
    self.navigationItem.revealSidebarDelegate = self;
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)revealLeftSidebar
{
    [self.navigationController toggleRevealState:JTRevealedStateLeft];
    if(self.view.userInteractionEnabled)
        self.view.userInteractionEnabled = NO;
    else
        self.view.userInteractionEnabled = YES;
    
}

// This is an examle to configure your sidebar view through a custom UIViewController
- (UIView *)viewForLeftSidebar
{
    // Use applicationViewFrame to get the correctly calculated view's frame
    // for use as a reference to our sidebar's view
    CGRect viewFrame = self.navigationController.applicationViewFrame;
    SidebarViewController *controller = self.sidebarViewController;
    if ( ! controller) {
        self.sidebarViewController = [[SidebarViewController alloc] init];
        self.sidebarViewController.sidebarDelegate = self;
        controller = self.sidebarViewController;
        controller.title = @"PhotoX";
    }
    controller.view.frame = CGRectMake(0, viewFrame.origin.y, 270, viewFrame.size.height);
    controller.view.autoresizingMask = UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleHeight;
    
    return controller.view;
}

#pragma sidebar delegate


- (void)sidebarViewController:(SidebarViewController *)sidebarViewController didSelectObject:(NSObject *)object atIndexPath:(NSIndexPath *)indexPath {
    
    [self.navigationController setRevealedState:JTRevealedStateNo];
    self.view.userInteractionEnabled = YES;
   // timetableViewController.navigationItem.title = title;
    /*
    if ([album isEqualToString:(NSString *)object])
    {
        viewController = [[AlbumViewController alloc] initWithNibName:@"AlbumViewController" bundle:nil];

    }
    else if ([@"홈" isEqualToString: (NSString *)object])
    {
        viewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];

    }
    else if ([@"할일" isEqualToString: (NSString *)object])
    {
        viewController = [[TodoViewController alloc] initWithNibName:@"TodoViewController" bundle:nil];
    }
    else if ([@"내 캠페인" isEqualToString: (NSString *)object])
    {
        viewController = [[MyCampaignViewController alloc] initWithNibName:@"MyCampaignViewController" bundle:nil];
        
    }
    else if ([@"설정" isEqualToString: (NSString *)object])
    {
        viewController = [[SettingViewController alloc] initWithNibName:@"SettingViewController" bundle:nil];
    }*/
    [self.navigationController setViewControllers:@[object] animated:NO];

    /*
     ViewController *controller = [[ViewController alloc] init];
     controller.view.backgroundColor = [UIColor viewFlipsideBackgroundColor];
     controller.title = (NSString *)object;
     controller.leftSidebarViewController  = sidebarViewController;
     controller.leftSelectedIndexPath      = indexPath;
     controller.label.text = [NSString stringWithFormat:@"Selected %@ from LeftSidebarViewController", (NSString *)object];
     sidebarViewController.sidebarDelegate = controller;*/
    // [self.navigationController setViewControllers:[NSArray arrayWithObject:controller] animated:NO];
    
}

- (NSIndexPath *)lastSelectedIndexPathForSidebarViewController:(SidebarViewController *)sidebarViewController {
    return [[NSIndexPath alloc] initWithIndex:0];
    /*return self.leftSelectedIndexPath;*/
}




@end
