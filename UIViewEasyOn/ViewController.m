//
//  ViewController.m
//  UIViewEasyOn
//
//  Created by LEE CHIEN-MING on 4/1/15.
//  Copyright (c) 2015 CHIENMING LEE. All rights reserved.
//

#import "ViewController.h"
#import "UIView+EasyOn.h"
#import "UIView+AddSubviews.h"

@interface ViewController ()
@property (nonatomic, strong) UIView *contenView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Add a content view with addUIView: method define in category header
    // the contentView will be returned by addUIView: method
    self.contenView = [self.view addUIView:^(UIView *contentView) {
        contentView.frame = CGRectMake(10.0f, 20.0f, 200.0f, 200.0f);
        contentView.backgroundColor = [UIColor lightGrayColor];
        
        // add a top label with 'add' blcok
        contentView.add([UILabel class], ^(UILabel *aLabel) {
            aLabel.frame = CGRectMake(0.0f, 0.0f, 200.0f, 20.0f);
            aLabel.backgroundColor = [UIColor blackColor];
            aLabel.textColor = [UIColor lightTextColor];
            aLabel.font = [UIFont boldSystemFontOfSize:14.0f];
            aLabel.text = @"Added UILabel successfully";
        });
        
        // add a background imageview
        [contentView addUIImageView:^(UIImageView *anImageView) {
            anImageView.frame = CGRectMake(0.0f, 20.0f, 200.0f, 180.0f);
            anImageView.image = [UIImage imageNamed:@"green_grace.png"];
        }];
        
        // add a symbol with 'add' blcok
        contentView.add([UIImageView class], ^(UIImageView *anImageView){
            anImageView.frame = CGRectMake(0.0f, 0.0f, 50.0f, 50.0f);
            anImageView.center = CGPointMake(CGRectGetWidth(contentView.frame)/2,
                                             CGRectGetHeight(contentView.frame)/2);
            anImageView.image = [UIImage imageNamed:@"close_sign.png"];
        });
    }];
}

@end
