//
//  RequestParmClass.m
//  StartNetwork
//
//  Created by Nuclominus on 01.01.14.
//  Copyright (c) 2014 Black. All rights reserved.
//

#import "RequestParmClass.h"

@implementation RequestParmClass

- (id)init
{
    self = [super init];
    if (self) {
        _paremsRequest = [[NSMutableDictionary alloc]init];
    }
    return self;
}
@end
