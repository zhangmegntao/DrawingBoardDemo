//
//  MTDrawingBoardView.m
//  DrawingBoardDemo
//
//  Created by 张梦涛 on 2017/12/12.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTDrawingBoardView.h"
#import "MTContextRef.h"

@interface MTDrawingBoardView(){
    CGMutablePathRef currentPath;//路径
}
//是否擦除
@property (nonatomic, assign) BOOL isEarse;
//存储所有的路径
@property (nonatomic, strong) NSMutableArray *stroks;
//存储所有的路径备份
@property (nonatomic, strong) NSMutableArray *stroksBackUp;
//画笔颜色
@property (nonatomic, strong) UIColor *lineColor;
//线条宽度
@property (nonatomic, assign) CGFloat lineWidth;
@end
@implementation MTDrawingBoardView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


-(NSMutableArray *)stroks{
    if(_stroks == nil){
        _stroks = @[].mutableCopy;
    }
    return _stroks;
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    for (MTContextRef *stroke in self.stroks) {
        [stroke strokeWithContext:context];
    }
}

/** 清屏 */
- (void)clearScreen {
    _isEarse = NO;
    [_stroks removeAllObjects];
    [self setNeedsDisplay];
}

/** 恢复操作 */
- (void)reinstateScreen{
    _isEarse = NO;
    if (self.stroks.count < self.stroksBackUp.count) {
        [_stroks addObject:self.stroksBackUp[self.stroks.count]];
        [self setNeedsDisplay];
    }
}

/** 撤消操作 */
- (void)revokeScreen {
    _isEarse = NO;
    [_stroks removeLastObject];
    [self setNeedsDisplay];
}

/** 擦除 */
- (void)eraseSreen {
    self.isEarse = YES;
}
/** 设置画笔颜色 */
- (void)setStrokeColor:(UIColor *)lineColor {
    _isEarse = NO;
    self.lineColor = lineColor;
    //    [self setNeedsDisplay];
}
/** 设置画笔大小 */
- (void)setStrokeWidth:(CGFloat)lineWidth {
    _isEarse = NO;
    self.lineWidth = lineWidth;
}
- (void)dealloc {
    CGPathRelease(currentPath);
}

//手指触摸到屏幕
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建路径
    currentPath = CGPathCreateMutable();
    //初始化画笔属性
    MTContextRef *stroke = [[MTContextRef alloc] init];
    stroke.pathRef = currentPath;
    stroke.blendMode = _isEarse ? kCGBlendModeDestinationIn : kCGBlendModeNormal;
    stroke.boardWidth = _isEarse ? 20.0 : _lineWidth;
    stroke.boardColor = _isEarse ? [UIColor clearColor] : _lineColor;
    [self.stroks addObject:stroke];
    self.stroksBackUp = self.stroks.mutableCopy;
    //获取触摸点
    UITouch *touch = [touches anyObject];
    //获取对应位置信息
    CGPoint point = [touch locationInView:self];
    CGPathMoveToPoint(currentPath, NULL, point.x, point.y);
    
}
//手指在屏幕上移动
-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    CGPathAddLineToPoint(currentPath, NULL, point.x, point.y);
    [self setNeedsDisplay];
}
//手指离开屏幕
-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}
//取消手势
-(void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
}

@end
