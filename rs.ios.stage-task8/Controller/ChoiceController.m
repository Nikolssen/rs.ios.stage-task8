//
//  ChoiceController.m
//  rs.ios.stage-task8
//
//  Created by Admin on 18.07.2021.
//

#import "ChoiceController.h"
#import "RoundedButton.h"

@interface ChoiceController ()
@property (nonatomic, strong) NSArray<RoundedButton*>* buttons;
@property (nonatomic, assign) CanvasPicture selectedPicture;

@end

@implementation ChoiceController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationItem.title = @"Drawings";
    RoundedButton* button1 = [RoundedButton new];
    RoundedButton* button2 = [RoundedButton new];
    RoundedButton* button3 = [RoundedButton new];
    RoundedButton* button4 = [RoundedButton new];
    
    [button1 addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchUpInside];
    [button3 addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchUpInside];
    [button4 addTarget:self action:@selector(selectItem:) forControlEvents:UIControlEventTouchUpInside];
    
    [button1 setTitle:@"Planet" forState:UIControlStateNormal];
    [button2 setTitle:@"Head" forState:UIControlStateNormal];
    [button3 setTitle:@"Tree" forState:UIControlStateNormal];
    [button4 setTitle:@"Landscape" forState:UIControlStateNormal];
    self.buttons = @[button1, button2, button3, button4];
    UIStackView* stackView = [[UIStackView alloc] initWithArrangedSubviews: self.buttons];
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.distribution = UIStackViewDistributionEqualSpacing;
    stackView.spacing = 15;
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    button1.translatesAutoresizingMaskIntoConstraints = NO;
    button2.translatesAutoresizingMaskIntoConstraints = NO;
    button3.translatesAutoresizingMaskIntoConstraints = NO;
    button4.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:stackView];
    [NSLayoutConstraint activateConstraints:@[[stackView.topAnchor constraintEqualToAnchor:self.view.topAnchor constant:114], [stackView.widthAnchor constraintEqualToConstant:200], [stackView.heightAnchor constraintEqualToConstant:205], [stackView.centerXAnchor constraintEqualToAnchor: self.view.centerXAnchor]]];
    
    self.buttons[self.selectedPicture].selected = YES;
}

- (void) selectItem: (RoundedButton*) sender{
    self.buttons[self.selectedPicture].selected = NO;
    self.selectedPicture = [self.buttons indexOfObject:sender];
    sender.selected = YES;
    if (self.delegate) {
        [self.delegate didSelectPicture:self.selectedPicture];
    }
    
}

- (instancetype) initWithSelectedPicture:(CanvasPicture)  selectedPicture{
    self = [super init];
    if (self){
        self.selectedPicture = selectedPicture;
    }
    return self;
}


@end
