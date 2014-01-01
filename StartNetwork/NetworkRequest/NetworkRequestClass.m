//
//  NetworkRequestClass.m
//  StartNetwork
//
//  Created by Nuclominus on 01.01.14.
//  Copyright (c) 2014 Black. All rights reserved.
//

#import "NetworkRequestClass.h"

@implementation NetworkRequestClass

- (id)init
{
    self = [super init];
    if (self) {
        
    }
    return self;
}

- (void)sendPostRequest:(RequestParmClass*)params{
    ASIFormDataRequest *request = [ASIFormDataRequest requestWithURL:[NSURL URLWithString:params.urlRequest]];
    request.tag = params.idRequest;
    
    if(params.typeRequest!=NULL){
        [request setRequestMethod:params.typeRequest];
        if (params.paremsRequest!=NULL) {
            for (NSString * value in params.paremsRequest) {
                [request setPostValue:[params.paremsRequest objectForKey:value] forKey:value];
            }
        }
    }
    
    [request setDelegate:self];
    [request startAsynchronous];
}


#pragma mark - ASIHTTPRequest delegate methods
- (void)requestStarted:(ASIHTTPRequest *)request{
    NSLog(@"request start");
}

- (void)requestFinished:(ASIHTTPRequest *)request {
    NSMutableArray *respone = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingMutableContainers error:nil];
    [self.delegate requestAnswer:respone withID:request.tag];
}

- (void)requestFailed:(ASIHTTPRequest *)request{
    NSLog(@"request failed with error ===> %@",request.responseData);
}

@end
