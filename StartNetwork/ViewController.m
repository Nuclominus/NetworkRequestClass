//
//  ViewController.m
//  StartNetwork
//
//  Created by Nuclominus on 01.01.14.
//  Copyright (c) 2014 Black. All rights reserved.
//

#import "ViewController.h"
#import "RequestParmClass.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    RequestParmClass * requestObject = [[RequestParmClass alloc]init];
    // url
    requestObject.urlRequest = @"";
    // id/tag request need if we have more the one requests
    // use some enum
    requestObject.idRequest = 1;
    requestObject.typeRequest = @"POST";
    // some parms if need
    [requestObject.paremsRequest setObject:[NSNumber numberWithInt:876] forKey:@""];
    // save data to device
    requestObject.cashing = YES;
    // name by save .plist
    requestObject.nameRequest = @"First_Request";
    
    network = [[NetworkRequestClass alloc]init];
    network.delegate = self;
    [network sendPostRequest:requestObject];
}

#pragma mark - Network answer
-(void)requestAnswer:(id)answer withID:(int)tag{
     NSLog(@"respone %d ===> %@",tag,answer);
}
#pragma mark -

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
