//
//  EFMViewController.m
//  EternalForceModal
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import "EFMViewController.h"

@interface EFMViewController ()

- (void)openSecondViewController;

@end

@implementation EFMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonTapped:(id)sender
{
    [self openSecondViewController];
}

#pragma EMFSecondViewController delegate
- (void)didPressCloseButton
{
    [self dismissViewControllerAnimated:YES completion:^(){
        [self openSecondViewController];
    }];
}

- (void)openSecondViewController
{
    EFMSecondViewController *secondViewController = [[EFMSecondViewController alloc] initWithNibName:@"EFMSecondViewController" bundle:nil];
    
    secondViewController.delegate = self;
    [self presentViewController:secondViewController animated:YES completion:nil];
}

@end