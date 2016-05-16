//
//  JJSpringView.m
//  UIDynamicPractice
//
//  Created by 吕军见 on 16/5/15.
//  Copyright © 2016年 joson. All rights reserved.
//

#import "JJSpringView.h"

@implementation JJSpringView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.attachment.frequency = 0.5;
        self.attachment.damping = 0.5;
//
        //监听center的改变
        [self.boxV addObserver:self forKeyPath:@"center" options:NSKeyValueObservingOptionNew context:@"jj"];
        
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context{
    
    NSLog(@"中心点变了");
    [self setNeedsDisplay];
}


- (void)dealloc{
    
    [self.boxV removeObserver:self forKeyPath:@"center"];
}
@end

