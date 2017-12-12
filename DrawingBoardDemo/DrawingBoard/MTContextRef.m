//
//  MTContextRef.m
//  DrawingBoardDemo
//
//  Created by 张梦涛 on 2017/12/12.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTContextRef.h"

@implementation MTContextRef
- (void)strokeWithContext:(CGContextRef)context{
    //设置颜色
    CGContextSetStrokeColorWithColor(context, [self.boardColor CGColor]);
    CGContextSetLineWidth(context, self.boardWidth);
    CGContextSetBlendMode(context, self.blendMode);
    CGContextBeginPath(context);
    CGContextAddPath(context, self.pathRef);
    CGContextStrokePath(context);
}

@end
