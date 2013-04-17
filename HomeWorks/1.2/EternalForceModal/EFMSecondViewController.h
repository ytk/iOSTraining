//
//  EFMSecondViewController.h
//  EternalForceModal
//
//  Created by 武田 祐一 on 2013/04/16.
//  Copyright (c) 2013年 武田 祐一. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol EMFSecondViewControllerDelegate <NSObject>

-(void)didPressCloseButton;

@end


@interface EFMSecondViewController : UIViewController

@property (nonatomic, weak) id<EMFSecondViewControllerDelegate> delegate;

- (IBAction)closeButtonTapped:(id)sender;

@end
