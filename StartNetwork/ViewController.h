//
//  ViewController.h
//  StartNetwork
//
//  Created by Nuclominus on 01.01.14.
//  Copyright (c) 2014 Black. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NetworkRequestClass.h"

@interface ViewController : UIViewController<NetworkRequestDelegate>
{
    NetworkRequestClass * network;
}
@end
