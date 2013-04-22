//
//  SVSViewController.m
//  scrollViewSample
//
//  Created by 武田 祐一 on 2013/04/19.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "SVSViewController.h"

@interface SVSViewController ()

- (UIView *)findImageView:(UIScrollView *)scrollView;

@end

@implementation SVSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    // imageView 生成
    UIImage *image = [UIImage imageNamed:@"big_image.jpg"];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, image.size.width, image.size.height)];
    imageView.image = image;
    
    // scrollView 生成
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    scrollView.contentSize = imageView.frame.size;
    scrollView.maximumZoomScale = 3.0; // 最大倍率
    scrollView.minimumZoomScale = 0.5; // 最小倍率
    scrollView.delegate = self;
    
    // imageView -> scrollView -> rootView の階層に配置
    [scrollView addSubview:imageView];
    [self.view addSubview:scrollView];
    
    // 指定位置にスクロール(ズームはしないので初期スケールを保持して後で戻す)
    float originalScale = scrollView.zoomScale;
    [scrollView zoomToRect:CGRectMake(600,500,0,0) animated:YES]; // いまいち CGRectMake の値の調整がよくわからず
    scrollView.zoomScale = originalScale;
}

// ズームする view 扱う delegate メソッド
- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [self findImageView:scrollView];
}

// スクロールされたら NSLog する delegate メソッド
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([self findImageView:scrollView]) {
        NSLog(@"ImageView is scrolling!");
    }
}

// ステータスバーがタップされたときの delegate メソッド。YES を返すと トップにスクロール
- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView
{
	NSLog(@"Status bar was tapped!");
	return YES;
}

// UIIMageView を subviews から探して返す
- (UIView *)findImageView:(UIScrollView *)scrollView
{
    for (UIView *view in scrollView.subviews) {
        if ([view isKindOfClass:[UIImageView class]]) {
            return view;
        }
    }
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
