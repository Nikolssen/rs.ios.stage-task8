//
//  ViewController.m
//  rs.ios.stage-task8
//
//  Created by Ivan Budovich on 7/16/21.
//

#import "ViewController.h"
#import "RoundedButton.h"
#import "ColorButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    ColorButton* button = [[ColorButton alloc] init];
    button.frame = CGRectMake(100, 100, 100, 100);
    button.keyColor = UIColor.redColor;
    [button addTarget:self action:@selector(clickButton:) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview: button];
    button.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[ [button.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor], [button.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], [button.widthAnchor constraintEqualToConstant:40], [button.heightAnchor constraintEqualToConstant:40]]];
    
    // Do any additional setup after loading the view.
}

-(void) clickButton:(UIButton*) sender{
    ColorButton* button = (ColorButton*) sender;
    button.selected = !button.isSelected;
}

@end
