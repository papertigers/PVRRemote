//
//  XBMCAPIClient.m
//  PVR Remote
//
//  Created by Michael Zeller on 8/4/13.
//  Copyright (c) 2013 Lights and Shapes. All rights reserved.
//

#import "XBMCAPIClient.h"
#import "AFJSONRPCClient.h"

@implementation XBMCAPIClient

+ (XBMCAPIClient *)sharedXBMCAPIClient
{
    //code
    static dispatch_once_t pred;
    static XBMCAPIClient *_sharedXBMCClient = nil;
    
    dispatch_once(&pred, ^{ _sharedXBMCClient = [XBMCAPIClient clientWithEndpointURL:[NSURL URLWithString:@"http://10.0.1.23:8080/jsonrpc"]]; });
    return _sharedXBMCClient;
}
- (void)updateURL:(NSURL *)URL {
    //code
}
@end
