//
//  JJBasicView.m
//  UIDynamicPractice
//
//  Created by 吕军见 on 16/5/15.
//  Copyright © 2016年 joson. All rights reserved.
//

#import "JJBasicView.h"

@implementation JJBasicView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BackgroundTile"]];
        
        UIImageView *BoxView =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"Box1"]];
        
        BoxView.center = CGPointMake(self.center.x, 130);
        
        [self addSubview:BoxView];
        
        self.boxV = BoxView;
        
        UIDynamicAnimator *animator = [[UIDynamicAnimator alloc]initWithReferenceView:self];
        
        self.animator = animator;
        
        
        
    }
    return self;
}

@end
