//
//  ViewController.m
//  BasicObjectiveC
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "ViewController.h"
#import "TestQueue.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // TODO ここに課題を書き進めていってください
    
    // 課題1
    NSLog(@"課題1");
    NSArray *array = @[
        @{
            @"domain": @"mixi.jp",
            @"entry":  @[
                @"list_voice.pl", @"list_diary.pl", @"list_mymall_item.pl",
            ],
        },
        @{
            @"domain": @"mmall.jp",
            @"entry":  @[
                @{
                    @"path":  @"add_diary.pl",
                    @"query": @[
                        @{
                            @"tag_id": @7,
                        },
                    ],
                },
            ],
        },
        @{
            @"domain": @"itunes.apple.com",
        },
    ];
    NSLog(@"%@",array);
    
    // 課題2
    NSLog(@"課題2");
    TestQueue *queue = [[TestQueue alloc] init];
    NSLog(@"queue = %@", [queue get]);
    NSLog(@"pushed element = %@", @1);
    [queue push:@1];
    NSLog(@"pushed element = %@", @2);
    [queue push:@2];
    NSLog(@"queue = %@", [queue get]);
    NSLog(@"queue size = %d", [queue size]);
    NSLog(@"poped element = %@", [queue pop]);
    NSLog(@"queue = %@", [queue get]);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
