//
//  ColorPanel.m
//  rs.ios.stage-task8
//
//  Created by Admin on 16.07.2021.
//

#import "ColorPanel.h"
#import "ColorButton.h"
@interface ColorPanel()
@property (nonatomic, strong) UIStackView* stackView;

@property (nonatomic, strong) NSMutableArray <ColorButton*>* selectedButtons;
@property(nonatomic, strong) NSArray<ColorButton*>* buttons;
@end
@implementation ColorPanel

- (void)awakeFromNib{
    [super awakeFromNib];
    [self configure];
 
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}


- (void) configure{
    
    NSArray<UIColor*>* colors1 = @[[UIColor colorNamed:@"RSRed"], [UIColor colorNamed:@"RSIndigo"], [UIColor colorNamed:@"RSGreen"], [UIColor colorNamed:@"RSGray"], [UIColor colorNamed:@"RSViolet"], [UIColor colorNamed:@"RSSalmon"]];
    NSArray<UIColor*>* colors2 = @[[UIColor colorNamed:@"RSOrange"], [UIColor colorNamed:@"RSCyan"], [UIColor colorNamed:@"RSPink"], [UIColor colorNamed:@"RSCyprus"], [UIColor colorNamed:@"RSDarkGreen"], [UIColor colorNamed:@"RSBrown"]];
    NSMutableArray* buttons = [NSMutableArray new];
    UIStackView* stackView1 = [self stackViewOfButtonsOfColors:colors1];
    [buttons addObjectsFromArray:stackView1.arrangedSubviews];
    UIStackView* stackView2 = [self stackViewOfButtonsOfColors:colors2];
    [buttons addObjectsFromArray:stackView2.arrangedSubviews];
    self.buttons = [buttons copy];
    UIStackView* verticalStackView = [[UIStackView alloc] initWithArrangedSubviews:@[stackView1, stackView2]];
    verticalStackView.axis = UILayoutConstraintAxisVertical;
    verticalStackView.alignment = UIStackViewAlignmentFill;
    verticalStackView.distribution = UIStackViewDistributionFillEqually;
    verticalStackView.spacing = 20;
    [self addSubview:verticalStackView];
    self.translatesAutoresizingMaskIntoConstraints = NO;
    verticalStackView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[[verticalStackView.centerYAnchor constraintEqualToAnchor:self.centerYAnchor], [verticalStackView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor]]];
    
    self.selectedButtons = [NSMutableArray new];
}


- (UIStackView*) stackViewOfButtonsOfColors:  (NSArray<UIColor*>*) colors{
    UIStackView* stackView = [[UIStackView alloc] init];
    stackView.translatesAutoresizingMaskIntoConstraints = NO;
    [NSLayoutConstraint activateConstraints:@[[stackView.heightAnchor constraintEqualToConstant:40.0], [stackView.widthAnchor constraintEqualToConstant:340.0]]];
    stackView.axis = UILayoutConstraintAxisHorizontal;
    stackView.alignment = UIStackViewAlignmentFill;
    stackView.distribution = UIStackViewDistributionFillEqually;
    stackView.spacing = 20;
    
    for (UIColor* color in colors) {
        ColorButton* button = [[ColorButton alloc] init];
        button.keyColor = color;
        button.selected = NO;
        [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
        [stackView addArrangedSubview:button];
        
    }
    return stackView;
}
-(void)activateColors:(NSArray<UIColor*>*)colors{
    for (UIColor* color in colors){
        for (ColorButton* button in self.buttons){
            if ([button.keyColor isEqual:color]){
                button.selected = YES;
                [self.selectedButtons addObject:button];
            }
        }
    }
}
- (void) buttonTapped: (ColorButton*) button{
    
    button.selected = !button.selected;
    if ([self.selectedButtons containsObject: button]) {
        [self.selectedButtons removeObject:button];
    }
    else {
        if (self.selectedButtons.count == 3) {
            self.selectedButtons[0].selected = NO;
            [self.selectedButtons removeObjectAtIndex:0];
        }
        [self.selectedButtons addObject:button];
    }
    

    if (self.delegate) {
        NSMutableArray<UIColor*> *colors = [NSMutableArray new];
        for (ColorButton* button in self.selectedButtons) {
            [colors addObject:button.keyColor];
        }
        [self.delegate colorPanel:self didSelectColors: colors];
    }
    
}
@end
