//
//  JJCollisionView.m
//  UIDynamicPractice
//
//  Created by 吕军见 on 16/5/15.
//  Copyright © 2016年 joson. All rights reserved.
//

#import "JJCollisionView.h"

@implementation JJCollisionView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *redV = [[UIView alloc]initWithFrame:CGRectMake(0, 400, 200, 40)];
       
        redV.backgroundColor = [UIColor redColor];
        
        [self addSubview: redV];
        
        UIGravityBehavior *gravity = [[UIGravityBehavior alloc]initWithItems:@[self.boxV]];
        
        [self.animator addBehavior:gravity];
        
        
        // 添加边缘检测行为
        
        UICollisionBehavior * collision = [[UICollisionBehavior alloc]initWithItems:@[self.boxV]];
        
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        [collision addBoundaryWithIdentifier:@"124" fromPoint:CGPointMake(0, 400) toPoint:CGPointMake(180, 400)];
        [self.animator addBehavior:collision];
        
        
        
        
        
        
        
        
        
    }
    return self;
}

@end
