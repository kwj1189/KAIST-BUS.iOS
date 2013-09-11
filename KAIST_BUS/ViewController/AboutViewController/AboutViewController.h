//
//  SettingViewController.h
//  photox
//
//  Created by Include on 13. 8. 7..
//  Copyright (c) 2013년 김원중. All rights reserved.
//

#import "RootViewControllerBase.h"
#import <MessageUI/MessageUI.h>

@interface AboutViewController : RootViewControllerBase<MFMailComposeViewControllerDelegate, UITableViewDataSource, UITableViewDelegate>
@end
