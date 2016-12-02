//
//  XXXSegmentView.m
//  Haitao
//
//  Created by zsy78191 on 15/6/19.
//  Copyright (c) 2015年 Gerinn. All rights reserved.
//
// Github: https://github.com/zsy78191/XXXSegmentView

#import "XXXSegmentView.h"

@interface XXXSegmentView()
@property (nonatomic, assign) NSInteger number;
@property (nonatomic, strong) UIView* selectView;
@property (nonatomic, assign) NSInteger selected;
@end

@implementation XXXSegmentView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


- (UIView *)selectView
{
    if (!_selectView) {
        _selectView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, self.heightOfIndictor)];
        [self addSubview:_selectView];
        _selectView.backgroundColor = self.tintColor;
    }
    return _selectView;
}

- (void)setHeightOfIndictor:(CGFloat)heightOfIndictor
{
    _heightOfIndictor = heightOfIndictor;
    
    self.selectView.bounds = ({
        CGRect rect = self.selectView.bounds;
        rect.size.height = heightOfIndictor;
        rect;
    });
}

- (UIColor *)baseColor
{
    if (!_baseColor) {
        _baseColor = [UIColor blackColor];
    }
    return _baseColor;
}


- (void)awakeFromNib
{
    [super awakeFromNib];
    [self loadView];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self loadView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [super drawRect:rect];
    //// Rectangle Drawing
    if (self.hasBreakline) {
        CGFloat width = rect.size.width / self.number;
        
        for (int i = 0; i < self.number - 1; i ++) {
            UIBezierPath* rectanglePath = [UIBezierPath bezierPathWithRect: CGRectMake(width*(i+1) - self.breaklineSize.width/2, (rect.size.height - self.breaklineSize.height) / 2, self.breaklineSize.width, self.breaklineSize.height)];
            [self.breaklineColor setFill];
            [rectanglePath fill];
        }
    }
}

- (void)setHasBreakline:(BOOL)hasBreakline
{
    _hasBreakline = hasBreakline;
    [self setNeedsDisplay];
}

- (void)setBreaklineColor:(UIColor *)breaklineColor
{
    _breaklineColor = breaklineColor;
    [self setNeedsDisplay];
}

- (void)setBreaklineSize:(CGSize)breaklineSize
{
    _breaklineSize = breaklineSize;
    [self setNeedsDisplay];
}

- (void)loadView
{
    self.breaklineSize = CGSizeMake(0.5, 18);
    self.breaklineColor = [UIColor colorWithRed:0.89 green:0.89 blue:0.89 alpha:1.00];
    self.hasBreakline = NO;
    self.leftAndRightLineEdge = 0;
    self.heightOfIndictor = 2;
    self.backgroundColor = [UIColor clearColor];
    
    UIView* line = [[UIView alloc] initWithFrame:CGRectMake(0, self.frame.size.height-0.5, self.frame.size.width, 0.5)];
    line.backgroundColor = [UIColor colorWithRed:0.9 green:0.9 blue:0.9 alpha:1];
    [self addSubview:line];
    line.tag = 100021;
    line.autoresizingMask = 0xff;
    
    [self setTintColor:self.tintColor];
}

- (void)setHasButtomLine:(BOOL)hasButtomLine
{
    _hasButtomLine = hasButtomLine;
    UIView* line = [self viewWithTag:100021];
    line.hidden = !hasButtomLine;
}

- (void)cleanAll
{
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UILabel class]]) {
             [obj removeFromSuperview];
        }
    }];
}

- (void)configForTitles:(NSArray *)titles
{
    [self cleanAll];
    self.number = titles.count;
    [titles enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        UILabel* la = [self standLabel];
        [la setText:obj];
        [la setBackgroundColor:[UIColor clearColor]];
        [self addSubview:la];
        la.tag = idx + 981;
    }];
    
    self.selected = 0;
    [self setSelectItemAtIndex:self.selected animate:NO];
    
    [self setNeedsDisplay];
}

- (void)setSelectItemAtIndex:(NSUInteger)idx
{
    [self setSelectItemAtIndex:idx animate:YES];
}

- (void)setSelectItemAtIndex:(NSUInteger)idx animate:(BOOL)animated
{
    self.idx = idx;
    __weak XXXSegmentView* weakSelf = self;
    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UILabel class]]) {
            UILabel* label = obj;
            if (weakSelf.selected + 981 == label.tag) {
                label.textColor = weakSelf.tintColor;
            }
            else
            {
                label.textColor = weakSelf.baseColor;
            }

        }
    }];
    
    void (^ setFrameBlock)(void) = ^{
        UILabel* label = (UILabel*)[weakSelf viewWithTag:idx + 981];
        [weakSelf.selectView setFrame:CGRectMake(label.frame.origin.x - weakSelf.leftAndRightLineEdge, self.frame.size.height - self.heightOfIndictor, label.frame.size.width + weakSelf.leftAndRightLineEdge*2, self.heightOfIndictor)];
    };
    
    if (animated) {
        [UIView animateWithDuration:0.2 animations:^{
              setFrameBlock();
        }];
    }
    else
    {
        setFrameBlock();
    }
}

- (void)setTintColor:(UIColor *)tintColor
{
    [super setTintColor:tintColor];
    self.selectView.backgroundColor = tintColor;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    
    UITouch* touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    NSInteger detla = self.frame.size.width / self.number;
    NSInteger touchNumber = point.x / detla;
    self.selected = touchNumber;
//    [self setNeedsLayout];
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setSelectItemAtIndex:touchNumber animate:YES];
    });
    
    if (self.didSelectBlock) {
        self.didSelectBlock(touchNumber);
    }
}


- (void)layoutSubviews
{
    [super layoutSubviews];

    [self.subviews enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[UILabel class]]) {
            UILabel* label = obj;
            CGRect rect = [self boundsWithLabel:label];
            [label setFrame:CGRectMake(0, 0, rect.size.width, rect.size.height)];
            label.center = CGPointMake(self.frame.size.width/(self.number*2)*((label.tag-981)*2+1), self.frame.size.height/2);
            if (self.selected + 981 == label.tag) {
                [self setSelectItemAtIndex:self.selected animate:NO];
                label.textColor = self.tintColor;
            }
            else
            {
                label.textColor = self.baseColor;
            }
            
        }
    }];
}


- (CGRect)boundsWithLabel:(UILabel*)label
{
    return [label.text boundingRectWithSize:CGSizeMake(CGFLOAT_MAX, label.frame.size.height) options:NSStringDrawingUsesFontLeading attributes:@{NSFontAttributeName:label.font} context:nil];
}

- (UILabel*)standLabel
{
    UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 50)];
    label.font = self.labelFont?self.labelFont:[UIFont systemFontOfSize:14];
    label.textColor = self.tintColor;
    return label;
}

- (void)setLabelFont:(UIFont *)labelFont
{
    _labelFont = labelFont;
    
    [self.subviews enumerateObjectsUsingBlock:^(__kindof UIView * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[UILabel class]]) {
            [(UILabel*)obj setFont:labelFont];
        }
    }];
}

@end
