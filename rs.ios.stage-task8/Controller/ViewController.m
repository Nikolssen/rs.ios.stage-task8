//
//  ViewController.m
//  rs.ios.stage-task8
//
//  Created by Ivan Budovich on 7/16/21.
//

#import "ViewController.h"
#import "RoundedButton.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    RoundedButton* button = [[RoundedButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 100);
    [button setTitle:@"Tittle" forState:UIControlStateNormal];

    [self.view addSubview: button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[ [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor], [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], [button.widthAnchor constraintEqualToConstant:100], [button.heightAnchor constraintEqualToConstant:30]]];
    
    // Do any additional setup after loading the view.
}


@end
