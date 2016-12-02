//
//  ViewController.m
//  XXXSegmentViewDemo
//
//  Created by 张超 on 15/12/31.
//  Copyright © 2015年 gerinn. All rights reserved.
//
// Github: https://github.com/zsy78191/XXXSegmentView

#import "ViewController.h"
#import "XXXSegmentView.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet XXXSegmentView *segment1;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self configSegment1];
    [self configSegment2];
}

- (void)configSegment1
{
    [self.segment1 configForTitles:@[@"Main",@"Monments",@"More",@"Me"]];
    self.segment1.baseColor = [UIColor colorWithRed:0 green:0.76 blue:0.89 alpha:1];
    self.segment1.tintColor = [UIColor colorWithRed:1 green:0.38 blue:0.43 alpha:1];
    self.segment1.hasBreakline = YES;
    [self.segment1 setDidSelectBlock:^(NSUInteger idx) {
        NSLog(@"segment 1 select %@",@(idx));
    }];
}

- (void)configSegment2
{
    XXXSegmentView* segment = [[XXXSegmentView alloc] initWithFrame:({
        CGRect rect = self.segment1.frame;
        rect.size.width = [UIScreen mainScreen].bounds.size.width - rect.origin.x * 2;
        rect.origin.y += 200;
        rect;
    })];
    
    [self.view addSubview:segment];
    
    [segment configForTitles:@[@"Main",@"More",@"Me"]];
    segment.baseColor = [UIColor colorWithRed:0.63 green:0.81 blue:0.20 alpha:1];
    segment.tintColor = [UIColor colorWithRed:1 green:0.38 blue:0.43 alpha:1];
    segment.hasButtomLine = NO;
    segment.leftAndRightLineEdge = 20;
    segment.labelFont = [UIFont fontWithName:@"Futura-CondensedExtraBold" size:18];
    
    [segment setDidSelectBlock:^(NSUInteger idx) {
        NSLog(@"segment 2 select %@",@(idx));
    }];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
