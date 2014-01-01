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

@protocol NetworkRequestDelegate <NSObject>
-(void)requestAnswer:(NSMutableArray*)answer withID:(int)tag;

@end

@interface NetworkRequestClass : NSObject{
    
}

@property(strong,nonatomic) id delegate;

-(void)sendPostRequest:(RequestParmClass*)params;

@end
