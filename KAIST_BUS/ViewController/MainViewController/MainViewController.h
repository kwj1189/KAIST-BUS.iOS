//
//  MainViewController.h
//  KAIST_BUS
//
//  Created by 김원중 on 13. 9. 12..
//  Copyright (c) 2013년 Kim Won Jung. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTRevealSidebarV2Delegate.h"
#import "SidebarViewController.h"

@interface MainViewController : UIViewController<JTRevealSidebarV2Delegate, SidebarViewControllerDelegate>
@property (strong, nonatomic) SidebarViewController *sidebarViewController;

@end
