# XXXSegmentView
A simple segment view.

This segment view can use storyboard or code.

##example 

```
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

