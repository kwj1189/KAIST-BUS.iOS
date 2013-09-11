//
//  SidebarViewController.h
//  photox
//
//  Created by Include on 13. 8. 12..
//  Copyright (c) 2013년 김원중. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol SidebarViewControllerDelegate;

@interface SidebarViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) id <SidebarViewControllerDelegate> sidebarDelegate;
@property (assign, nonatomic) BOOL cellNibRegistered;
@end

@protocol SidebarViewControllerDelegate <NSObject>

- (void)sidebarViewController:(SidebarViewController *)sidebarViewController didSelectObject:(NSObject *)object atIndexPath:(NSIndexPath *)indexPath;

@optional
- (NSIndexPath *)lastSelectedIndexPathForSidebarViewController:(SidebarViewController *)sidebarViewController;

@end