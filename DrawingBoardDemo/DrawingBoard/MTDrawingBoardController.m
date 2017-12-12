//
//  MTDrawingBoardController.m
//  DrawingBoardDemo
//
//  Created by 张梦涛 on 2017/12/12.
//  Copyright © 2017年 MT. All rights reserved.
//

#import "MTDrawingBoardController.h"
#import "MTDrawingBoardView.h"

@interface MTDrawingBoardController ()
@property(strong,nonatomic)MTDrawingBoardView *boardView;
@end

@implementation MTDrawingBoardController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    self.boardView  = [MTDrawingBoardView new];
    self.boardView.backgroundColor = [UIColor clearColor];
    [self.boardView setStrokeColor:[UIColor blackColor]];
    [self.boardView setStrokeWidth:2.0];
    self.boardView.frame = self.view.bounds;
    [self.view addSubview:self.boardView];
//    [self.navigationController.navigationBar setBarTintColor:[UIColor colorWithRed:0/255.0 green:200/255.0  blue:10/255.0 alpha:1]];
    [self setNavBtn];
}

-(void)revokeScreen{
    [self.boardView revokeScreen];
}
-(void)clearScreen{
    [self.boardView clearScreen];
}
-(void)setNavBtn{
    
    NSMutableArray<UIBarButtonItem*> *items = @[].mutableCopy;
    UIBarButtonItem *right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_back"] style:UIBarButtonItemStyleDone target:self action:@selector(revokeScreen)];
    [items addObject:right];
    right = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"icon_removeAll"] style:UIBarButtonItemStyleDone target:self action:@selector(clearScreen)];
    [items addObject:right];
    
    self.navigationItem.rightBarButtonItems = items;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
