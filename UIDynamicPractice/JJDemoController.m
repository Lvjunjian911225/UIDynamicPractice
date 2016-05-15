//
//  JJDemoController.m
//  UIDynamicPractice
//
//  Created by 吕军见 on 16/5/15.
//  Copyright © 2016年 joson. All rights reserved.
//

#import "JJDemoController.h"
#import "JJBasicView.h"
#import "JJSnapView.h"
#import "JJPushView.h"
#import "JJAttachmentView.h"
#import "JJSpringView.h"
#import "JJCollisionView.h"

@interface JJDemoController ()

@end

@implementation JJDemoController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JJBasicView * baseView;
    
    switch (self.funcID) {
        case kDemoFuncSnap:
            baseView = [[JJSnapView alloc]initWithFrame:self.view.bounds];
            break;
        case kDemoFuncPush:
            baseView = [[JJPushView alloc]initWithFrame:self.view.bounds];
            break;
        case kDemoFuncAttachment:
            baseView = [[JJAttachmentView alloc]initWithFrame:self.view.bounds];
            break;
        case kDemoFuncSpring:
            baseView = [[JJSpringView alloc]initWithFrame:self.view.bounds];
            break;
        case kDemoFuncCollision:
            baseView = [[JJCollisionView alloc]initWithFrame:self.view.bounds];
            break;
            
            
        default:
            break;
            
    }
    
    [self.view addSubview:baseView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
