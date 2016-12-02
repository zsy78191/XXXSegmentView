# XXXSegmentView
A simple segment view.

This segment view can use storyboard or code.

#New in 2016.12.2

```objc
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
```

##example 

```objc
@property (weak, nonatomic) IBOutlet XXXSegmentView *segment1;

[self.segment1 configForTitles:@[@"Main",@"Monments",@"More",@"Me"]];
self.segment1.baseColor = [UIColor colorWithRed:0 green:0.76 blue:0.89 alpha:1];
self.segment1.tintColor = [UIColor colorWithRed:1 green:0.38 blue:0.43 alpha:1];

[self.segment1 setDidSelectBlock:^(NSUInteger idx) {
NSLog(@"segment 1 select %@",@(idx));
}];
```

## result

![](https://raw.githubusercontent.com/zsy78191/XXXSegmentView/master/XXXSementView.gif)

