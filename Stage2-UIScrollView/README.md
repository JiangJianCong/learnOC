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



- 无限循环轮播图

1. 时刻监听
2. 找到合适的位置进行跳转
3. 设置5个页面，使得跳转更流畅 2 0 1 2 0 设置第一页在(414,0)这个坐标，到了最后一张图就跳		转
```objective-c
...
-(void) scrollview3 {
    UIScrollView *scrollview = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 50, 414, 200)];
    scrollview.contentSize = CGSizeMake(414*5, 200);
    scrollview.delegate = self;
    scrollview.pagingEnabled = true; // 分页
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 100, 100)];
    label.backgroundColor = [UIColor redColor];
    label.text = @"2";
    [scrollview addSubview:label];
    scrollview.contentOffset = CGPointMake(414, 0);
    
    for (int i = 0; i < 4 ; i++ ) {
        float labelx = (i+1)*414;
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(labelx, 0, 100, 100)];
        label.backgroundColor = [UIColor redColor];
        label.text = [NSString stringWithFormat:@"%d",i%3];
        [scrollview addSubview:label];
    }
    [self.view addSubview: scrollview];
}
...
/**
 监听内容
*/
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    //    float x = scrollView.contentOffset.x;
    //    NSLog(@"x%f",x);
    float x = scrollView.contentOffset.x;
    if (x == 414*4) {
        CGPoint point = CGPointMake(414, 0);
        scrollView.contentOffset = point;
    } else if(x==0){
        CGPoint point = CGPointMake(414*3, 0);
        scrollView.contentOffset = point;
    }
    
}

```

- 新闻轮播图
```objective-c
// 定义一个NSTimer 和 一个imageIndex
@interface ViewController ()<UIScrollViewDelegate> {
    UIScrollView *scrollview;
    NSTimer *timer;
    int imageIndex;
}
...
-(void)scrollview5 {
    scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 414, 200)];
    scrollview.contentSize = CGSizeMake(414 * 4, 200);
    scrollview.backgroundColor = [UIColor clearColor]; // 清除背景
    scrollview.pagingEnabled = true;
    scrollview.delegate = self;
    for (int index = 0; index < 4; index++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(414*index, 0, 414, 200)];
        NSString *imagePath = [NSString stringWithFormat:@"%d.jpg",index+1];
        imageView.image = [UIImage imageNamed:imagePath];
        [scrollview addSubview:imageView];
    }
    [self.view addSubview:scrollview];
    timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(imagePlay) userInfo:nil repeats:true];
    imageIndex = 0;
}
// 定时器的监听方法
-(void)imagePlay {
    scrollview.contentOffset = CGPointMake(imageIndex*414, 0);
    imageIndex++;
    if (imageIndex >= 4) {
        imageIndex = 0;
    }
}

```