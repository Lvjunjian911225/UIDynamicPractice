//
//  JJAttachmentView.m
//  UIDynamicPractice
//
//  Created by 吕军见 on 16/5/15.
//  Copyright © 2016年 joson. All rights reserved.
//

#import "JJAttachmentView.h"

@interface JJAttachmentView ()


@property (weak,nonatomic) UIImageView *anchorView;

@property (weak,nonatomic) UIImageView *offsetView;
@end

@implementation JJAttachmentView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.boxV.center = CGPointMake(self.center.x, 130);
        
        UIOffset offset = UIOffsetMake(20, 20);
        
        CGPoint anchorPoint = CGPointMake(self.boxV.center.x, 120);
        /**
         创建刚性附着行为对象
         */
        UIAttachmentBehavior *attachment = [[UIAttachmentBehavior alloc]initWithItem:self.boxV offsetFromCenter:offset attachedToAnchor:anchorPoint];
        
        [self.animator addBehavior:attachment];
        
        self.attachment = attachment;
        
        // 创建触摸点的图片框
        UIImageView *anchorView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        anchorView.center = anchorPoint;
        
        self.anchorView = anchorView;
        
        [self addSubview:anchorView];
        
        
        UIImageView *offsetView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        CGSize boxSize = self.boxV.bounds.size;
        
        
        offsetView.center = CGPointMake(boxSize.width*0.5 + offset.horizontal, boxSize.height*0.5 + offset.vertical);
        
        [self.boxV addSubview:offsetView];
        
        self.offsetView = offsetView;
        
        
        //创建手势识别器
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        
        [self addGestureRecognizer:pan];
        
        
    }
    return self;
}

- (void)panAction:(UIGestureRecognizer *)recognizer{
    
    CGPoint loc = [recognizer locationInView:self];
    
    if (recognizer.state == UIGestureRecognizerStateChanged) {
        
//        self.attachment.anchorPoint = loc;
        
        self.anchorView.center = loc;
        
        [self setNeedsDisplay];
    }
}

- (void)drawRect:(CGRect)rect{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    
    CGPoint endP = [self convertPoint:self.offsetView.center fromView:self.boxV];
    
    [path moveToPoint:endP];
    
    [path addLineToPoint:self.anchorView.center];
    
    
    path.lineWidth = 10;
    
    
    [[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0] setStroke];
    
    [path stroke];
}











@end
