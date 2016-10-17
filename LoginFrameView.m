//
//  LoginFrameView.m
//  JinJingZheng
//
//  Created by 迪远 王 on 2016/10/16.
//  Copyright © 2016年 andforce. All rights reserved.
//

#import "LoginFrameView.h"

@implementation LoginFrameView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code

    CGPoint start = CGPointMake(8, rect.size.height / 2);
    CGPoint end = CGPointMake(rect.size.width - 8, rect.size.height / 2);
    
    [self drawLineOnRect:rect start:start end:end];

}

- (void) drawLineOnRect:(CGRect ) rect start:(CGPoint) start end:(CGPoint) end{
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    CGContextSetLineCap(context, kCGLineCapSquare);
    //CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    //CGContextSetRGBFillColor(context, 200 / 255.0, 1.0, 1.0, 0.3);
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 0.0, 0.3);
    // Draw them with a 2.0 stroke width so they are a bit more visible.
    CGContextSetLineWidth(context, 1);
    
    
    CGContextBeginPath(context);
    
    //画笔移动到点(31,170)
    
    CGContextMoveToPoint(context,  start.x, start.y);
    CGContextAddLineToPoint(context, end.x, end.y);
    
    CGContextStrokePath(context);
}

@end
