//
//  JJSnapView.m
//  UIDynamicPractice
//
//  Created by 吕军见 on 16/5/15.
//  Copyright © 2016年 joson. All rights reserved.
//

#import "JJSnapView.h"

@implementation JJSnapView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapAction:)];
        
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tapAction:(UITapGestureRecognizer *)recognizer{
    
    [self.animator removeAllBehaviors];
    
    CGPoint loc = [recognizer locationInView:self];

    UISnapBehavior *snap = [[UISnapBehavior alloc] initWithItem:self.boxV snapToPoint:loc];
    
    snap.damping = 0.0;
    
    [self.animator addBehavior:snap];
    
    
}
@end
