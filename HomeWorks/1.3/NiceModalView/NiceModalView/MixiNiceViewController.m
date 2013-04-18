//
//  MixiNiceViewController.m
//  NiceModalView
//
//  Created by 鄭 基旭 on 2013/04/15.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import "MixiNiceViewController.h"
#import "UIViewController+NiceAnimation.h"

@interface MixiNiceViewController()

@end

@implementation MixiNiceViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSInteger allImageCount = 5;
// なぜ NSArrayじゃなくて　NSMutableArray か？　違いを探してみましょう
    // 動的に addObjct しているから？
    // 静的に NSArray で生成すれば置き換えられる？
    NSMutableArray *sampleImages = [NSMutableArray array];
    for (int currentIndex = 0; currentIndex < allImageCount; currentIndex++)
    {
        NSString *filename = [NSString stringWithFormat:@"%d.jpg", currentIndex];
        UIImage *img = [UIImage imageNamed:filename];
        [sampleImages addObject:img];
    }

	self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close"
                                                                              style:UIBarButtonItemStyleBordered
                                                                             target:self
                                                                             action:@selector(clickClose:)];

	static int index;
	index++;

    UIImageView *imageView = [[UIImageView alloc] initWithImage:[sampleImages objectAtIndex:index%allImageCount]];
    // insertSubview と addSubViewの違いを探してみましょう
    // add は完全に上に被せる。insert は階層を指定して被せられる？
	[self.view insertSubview:imageView atIndex:0];

// TODO: XIB上にある二つの各ボタンのTouchUpInsideイベントに　clickModalView：　と　clickPush:　を連結しましょう
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
    NSLog(@"viewWillAppear");
    
	[super viewWillAppear:animated];
// TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
    // view が出る度に呼ばれる？
    [self animationPopFrontScaleUp];
}

- (IBAction)clickPush:(id)sender
{
    NSLog(@"clickPush");

	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)clickModalView:(id)sender
{
    NSLog(@"clickModalView");
    
	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
// TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
    [self animationPushBack];
}

- (void)clickClose:(id)sender
{
    NSLog(@"clickClose");
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
