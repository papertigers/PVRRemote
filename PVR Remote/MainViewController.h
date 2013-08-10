//
//  MainViewController.h
//  PVR Remote
//
//  Created by Michael Zeller on 8/4/13.
//  Copyright (c) 2013 Lights and Shapes. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XBMCAPIClient.h"

@interface MainViewController : UIViewController

@property (strong, nonatomic) UIButton *menuButton;
@property (weak, nonatomic) XBMCAPIClient *client;


@end
