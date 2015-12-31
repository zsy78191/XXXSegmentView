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

@end
