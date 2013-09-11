//
//  RootViewControllerBase.h
//  photox
//
//  Created by Include on 13. 8. 12..
//  Copyright (c) 2013년 김원중. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTRevealSidebarV2Delegate.h"
#import "SidebarViewController.h"
@interface RootViewControllerBase : UIViewController<JTRevealSidebarV2Delegate, SidebarViewControllerDelegate>

@property (strong, nonatomic) SidebarViewController *sidebarViewController;
@property (strong, atomic) NSIndexPath *sidebarIndexPath;

- (void) showLoading;
- (void) hideLoading;
@property (strong, nonatomic) UIView *loadingView;
@end
