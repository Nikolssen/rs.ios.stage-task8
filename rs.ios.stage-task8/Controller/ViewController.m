//
//  ViewController.m
//  rs.ios.stage-task8
//
//  Created by Ivan Budovich on 7/16/21.
//

#import "ViewController.h"
#import "RoundedButton.h"
#import "ColorButton.h"
#import "ColorPanel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    ColorPanel* panel = [[ColorPanel alloc] init];
    panel.frame = CGRectMake(100, 100, 100, 100);
    [self.view addSubview: panel];
    panel.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[ [panel.centerYAnchor constraintEqualToAnchor:self.view.centerYAnchor], [panel.centerXAnchor constraintEqualToAnchor:self.view.centerXAnchor], [panel.widthAnchor constraintEqualToConstant:340], [panel.heightAnchor constraintEqualToConstant:100]]];
    self.navigationItem.title = @"Title";
    // Do any additional setup after loading the view.
}

-(void) clickButton:(UIButton*) sender{
    ColorButton* button = (ColorButton*) sender;
    button.selected = !button.isSelected;
}

@end
