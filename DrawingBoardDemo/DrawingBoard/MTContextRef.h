//
//  MTContextRef.h
//  DrawingBoardDemo
//  画笔属性
//  Created by 张梦涛 on 2017/12/12.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MTContextRef : NSObject
@property(assign, nonatomic) CGMutablePathRef pathRef;
@property(assign, nonatomic) CGBlendMode blendMode;

/**
 线条宽度
 */
@property(assign, nonatomic) CGFloat boardWidth;

/**
 线条颜色
 */
@property(strong, nonatomic) UIColor *boardColor;

/**
 根据属性设置画笔

 @param context 画笔
 */
- (void)strokeWithContext:(CGContextRef)context;
@end
