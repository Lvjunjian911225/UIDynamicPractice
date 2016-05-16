//
//  JJPushView.m
//  UIDynamicPractice
//
//  Created by 吕军见 on 16/5/15.
//  Copyright © 2016年 joson. All rights reserved.
//

#import "JJPushView.h"

@interface JJPushView ()

@property (weak,nonatomic) UIImageView *smallView;

@property (strong,nonatomic) UIPushBehavior *push;

@property (assign,nonatomic) CGPoint  currentP;
@end

@implementation JJPushView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // 添加一个图片框    默认设置为隐藏  在点击屏幕时 移动到点击的位置显示
        UIImageView *smallView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"AttachmentPoint_Mask"]];
        
        [self addSubview:smallView];
        
        self.smallView = smallView;
        
        smallView.hidden = YES;
        
        // 创建手势识别器
        
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
        
        [self addGestureRecognizer:pan];
        
        
        //创建推动行为  单次推动需要将active 设置为yes
        UIPushBehavior *push = [[UIPushBehavior alloc]initWithItems:@[self.boxV] mode: UIPushBehaviorModeInstantaneous];
        
        self.push = push;
        
        [self.animator addBehavior:push];
        
        //添加边缘检测
        
        UICollisionBehavior *collision = [[UICollisionBehavior alloc]initWithItems:@[self.boxV]];
        
        collision.translatesReferenceBoundsIntoBoundary = YES;
        
        [self.animator addBehavior:collision];
        
        
    }
    
    return self;
}


- (void)panAction:(UIPanGestureRecognizer *)recognizer{
    // 获取触摸点
    CGPoint loc = [recognizer locationInView:self];
    
    if (recognizer.state == UIGestureRecognizerStateBegan) {
        
        self.smallView.hidden = NO;
        
        self.smallView.center = loc;
    }else if (recognizer.state ==UIGestureRecognizerStateChanged){
        
        self.currentP = loc;
        
        [self setNeedsDisplay];
    }else if (recognizer.state == UIGestureRecognizerStateEnded){
        
        CGFloat offsetX = self.smallView.center.x - self.currentP.x;
        CGFloat offsetY = self.smallView.center.y - self.currentP.y;
        
        self.push.magnitude = hypotf(offsetX, offsetY);
        
        self.push.pushDirection = CGVectorMake(offsetX, offsetY);
        
        self.push.active = YES;
        
        
        
        //拖拽完毕后,重绘 去掉连接的线
        
        self.currentP = CGPointZero;
        
        self.smallView.center = CGPointZero;
        
        [self setNeedsDisplay];
    }
    
}


- (void)drawRect:(CGRect)rect{
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path moveToPoint:self.smallView.center];
    
    [path addLineToPoint:self.currentP];
    
    path.lineWidth = 10;
    
    [[UIColor colorWithRed:((float)arc4random_uniform(256) / 255.0) green:((float)arc4random_uniform(256) / 255.0) blue:((float)arc4random_uniform(256) / 255.0) alpha:1.0] setStroke];
    
    [path stroke];
}




@end
