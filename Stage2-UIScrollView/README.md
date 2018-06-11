# UIScrollView

- 属性
```objective-c
//    2:属性
scrollview1.contentSize = CGSizeMake(414*5, 200);
scrollview1.backgroundColor = [UIColor grayColor];
scrollview1.indicatorStyle = UIScrollViewIndicatorStyleWhite;
scrollview1.bounces = true; // 表明当前滑动是否有反弹效果
scrollview1.pagingEnabled = true; // 分页效果
scrollview1.scrollEnabled = true; // 使当前能够滑动和不能滑动
scrollview1.contentOffset = CGPointMake(414, 0); // 初始位置

```

- 将一个label放到第二个页面的时候
```
...
UILabel *lab = [[UILabel alloc]initWithFrame:CGRectMake(414, 0, 414, 50)];
lab.text = @"Hello";
lab.textColor = [UIColor redColor];
lab.backgroundColor = [UIColor grayColor];
lab.font = [UIFont systemFontOfSize:12.0];
[scrollview1 addSubview:lab];

...
```

- UIScrollViewDelegate的常用响应方法
```objective-c
- (void)scrollViewDidScroll:(UIScrollView *)scrollView;    
- 
```

- 使用delegate的步骤
```objective-c
// 首先声明
...
@interface ViewController ()<UIScrollViewDelegate>
...
...

scrollview1.delegate = self;

...
...
/**
 滚动的时候就不停回调
 1、精度很高
 2、滚动坐标：使用场景
 3、并不是线性增长
 
 @param scrollView 监听的scrollview
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    float x = scrollView.contentOffset.x;
    NSLog(@"x%f",x);
    
}

```

- 大图展示

```objective-c
/**
 大图展示
 1、UIScrollView 对象
 2、UIImageView
 3、UIImageView->UIScrollView
 4、UIScrollView->self.view
 */
 -(void)scrollview2 {    
    //    如果frame和contentsize 相等，就不能滚动;
    UIScrollView *scrollview1 = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 100, 414, 200)];
    scrollview1.contentSize = CGSizeMake(1440, 900);
    UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 1440, 900)];
    imageview.image = [UIImage imageNamed:@"5.jpg"];
    
    scrollview1.backgroundColor = [UIColor grayColor];
    [scrollview1 addSubview:imageview];
    [self.view addSubview:scrollview1];
}
```

