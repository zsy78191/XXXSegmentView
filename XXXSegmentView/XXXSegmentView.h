//
//  XXXSegmentView.h
//  Haitao
//
//  Created by zsy78191 on 15/6/19.
//  Copyright (c) 2015年 Gerinn. All rights reserved.
//
// Github: https://github.com/zsy78191/XXXSegmentView

#import <UIKit/UIKit.h>

@interface XXXSegmentView : UIView
{
    
}

- (void)configForTitles:(NSArray<NSString*>*)titles;

@property (nonatomic, assign) NSInteger idx;
@property (nonatomic, strong) void (^ didSelectBlock)(NSUInteger idx);
- (void)setSelectItemAtIndex:(NSUInteger)idx;
- (void)setSelectItemAtIndex:(NSUInteger)idx animate:(BOOL)animated;
/**
 *  set tint color
 *
 *  @param tintColor selected label's color and underline's color
 */
- (void)setTintColor:(UIColor *)tintColor;

/**
 *  unselected label's color
 */
@property (nonatomic, strong) UIColor* baseColor;

/**
 *  defalut is 0;
 */
@property (nonatomic, assign) CGFloat leftAndRightLineEdge;

/**
 *  defalut is YES;
 */
@property (nonatomic, assign) BOOL hasButtomLine;

/**
 *  label font; defalut is nil;
 */
@property (nonatomic, strong) UIFont* labelFont;


/**
 height of indictor , default is 2.0;
 */
@property (nonatomic, assign) CGFloat heightOfIndictor;


/**
 Breakline default is NO;
 */
@property (nonatomic, assign) BOOL hasBreakline;


/**
 default is CGSize(0.5,18)
 */
@property (nonatomic, assign) CGSize breaklineSize;


/**
 defalut is #E3E3E3 [UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.00]
 */
@property (nonatomic, strong) UIColor* breaklineColor;

@end
