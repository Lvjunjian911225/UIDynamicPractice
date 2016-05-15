//
//  JJDemoController.h
//  UIDynamicPractice
//
//  Created by 吕军见 on 16/5/15.
//  Copyright © 2016年 joson. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    
    kDemoFuncSnap,
    kDemoFuncPush,
    kDemoFuncAttachment,
    kDemoFuncSpring,
    kDemoFuncCollision
    
} kDemoFunc;

@interface JJDemoController : UIViewController

@property (assign,nonatomic)  kDemoFunc funcID;

@end
