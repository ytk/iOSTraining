//
//  MixiNiceViewController.m
//  NiceModalView
//
//  Created by 鄭 基旭 on 2013/04/15.
//  Copyright (c) 2013年 鄭 基旭. All rights reserved.
//

#import "MixiNiceViewController.h"

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
	[self.view insertSubview:imageView atIndex:0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
// TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
}

- (IBAction)clickPush:(id)sender
{
	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
}

- (IBAction)clickModalView:(id)sender
{
	MixiNiceViewController *viewController = [[MixiNiceViewController alloc] init];
    [self presentViewController:viewController animated:YES completion:nil];
// TODO : UIViewController+NiceAnimation にある関数を使って、いい感じの遷移になるようにしましょう
}

- (void)clickClose:(id)sender
{
// TODO : hint-> dismissViewControllerAnimated:
}

@end
