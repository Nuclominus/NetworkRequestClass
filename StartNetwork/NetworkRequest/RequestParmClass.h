//
//  RequestParmClass.h
//  StartNetwork
//
//  Created by Nuclominus on 01.01.14.
//  Copyright (c) 2014 Black. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RequestParmClass : NSObject

@property(strong,nonatomic) NSString * urlRequest;
@property(strong,nonatomic) NSString * typeRequest;
@property(strong,nonatomic) NSMutableDictionary * paremsRequest;
@property(nonatomic) int idRequest;

@end
