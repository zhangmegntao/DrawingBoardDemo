//
//  MTDrawingBoardView.h
//  DrawingBoardDemo
//  画图板视图
//  Created by 张梦涛 on 2017/12/12.
//  Copyright © 2017年 MT. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>

@interface MTDrawingBoardView : UIView
/** 清屏 */
- (void)clearScreen;
/** 撤消操作 */
- (void)revokeScreen;
/** 撤消操作 */
- (void)reinstateScreen;
/** 擦除 */
- (void)eraseSreen;
/** 设置画笔颜色 */
- (void)setStrokeColor:(UIColor *)lineColor;
/** 设置画笔大小 */
- (void)setStrokeWidth:(CGFloat)lineWidth;
@end
