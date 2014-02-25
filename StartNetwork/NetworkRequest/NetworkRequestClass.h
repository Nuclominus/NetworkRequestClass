//
//  NetworkRequestClass.h
//  StartNetwork
//
//  Created by Nuclominus on 01.01.14.
//  Copyright (c) 2014 Black. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
#import "RequestParmClass.h"
#import "CDFileManager.h"

@protocol NetworkRequestDelegate <NSObject>
-(void)requestAnswer:(id)answer withID:(int)tag;

@end

@interface NetworkRequestClass : NSObject{
    BOOL cash;
    NSString * saveByName;
}

@property(strong,nonatomic) id delegate;

-(void)sendPostRequest:(RequestParmClass*)params;

@end
