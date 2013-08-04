//
//  XBMCAPIClient.h
//  PVR Remote
//
//  Created by Michael Zeller on 8/4/13.
//  Copyright (c) 2013 Lights and Shapes. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFJSONRPCClient.h"


@interface XBMCAPIClient : AFJSONRPCClient

+ (XBMCAPIClient *)sharedXBMCAPIClient;
- (void)updateURL:(NSURL *)URL;

@end
