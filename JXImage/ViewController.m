//
//  ViewController.m
//  JXImage
//
//  Created by yuezuo on 16/5/4.
//  Copyright © 2016年 yuezuo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    UIImage * image = [UIImage imageNamed:@"001"];
    
    // 0.获取上下文，之前的都是在view的drawRect方法中获取，（跟上view关联的上下文的layer上下文）
    // 目前我们需要绘制图片到新的图片上，因此需要用到位图上下文
    
    // 怎么获取位图上下文，注意位图上下文的获取方式跟layer上下文不一样，位图上下文需要我们手动创建
    
    // 开启一个位图上下文，注意位图上下文跟view无关，所以不需要再drawRect
    
    // size:位图上下文的尺寸（新图片尺寸）
    // opaque:不透明度，YES：不透明，NO：透明，通常我们一般都是设置透明的上下文
    // scale:通常不需要缩放上下文，取值0表示不缩放
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    
    // 1.绘制原生图片
    [image drawAtPoint:CGPointZero];
    
    // 2.给原生的图片添加文字
    NSString * str = @"rookieJX";
    NSMutableDictionary * dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor redColor];
    dict[NSFontAttributeName] = [UIFont boldSystemFontOfSize:20];
    [str drawAtPoint:CGPointMake(150, 270) withAttributes:dict];
    
    // 3.生成一张图片给我们，从上下文中获取图片
    UIImage * imageNow = UIGraphicsGetImageFromCurrentImageContext();

    // 4.关闭上下文
    UIGraphicsEndImageContext();

    self.imageView.image = imageNow;
    
}


// 绘制直线
- (void)drawLine {
    UIImage * image = [UIImage imageNamed:@"001"];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    // 获取当前的上下文，不仅仅是layer的上下文，在这里是位图上下文
    CGContextRef ctf = UIGraphicsGetCurrentContext();
    
    CGContextMoveToPoint(ctf, 0, 0);
    CGContextAddLineToPoint(ctf, 200, 300);
    
    CGContextSetLineWidth(ctf, 20);
    [[UIColor redColor] setStroke];
    
    CGContextStrokePath(ctf);

    // 3.生成一张图片给我们，从上下文中获取图片
    UIImage * imageNow = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.关闭上下文
    UIGraphicsEndImageContext();
    
    self.imageView.image = imageNow;
    
}

// 绘制圆形
- (void)drawCir {
    UIImage * image = [UIImage imageNamed:@"001"];
    
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    
    UIBezierPath * path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 100, 100)];
    
    [[UIColor redColor] set];
    
    [path stroke];
    
    // 3.生成一张图片给我们，从上下文中获取图片
    UIImage * imageNow = UIGraphicsGetImageFromCurrentImageContext();
    
    // 4.关闭上下文
    UIGraphicsEndImageContext();

    self.imageView.image = imageNow;
    
}
@end
