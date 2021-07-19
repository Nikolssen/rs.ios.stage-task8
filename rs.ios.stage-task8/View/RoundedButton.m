//
//  RoundedButton.m
//  rs.ios.stage-task8
//
//  Created by Ivan Budovich on 7/16/21.
//

#import "RoundedButton.h"
@interface RoundedButton()
@property (nonatomic, strong) UIBezierPath* path;
@end

@implementation RoundedButton

- (void) setupViews{
    self.layer.masksToBounds = NO;
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 10.0;
    self.backgroundColor = UIColor.whiteColor;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOpacity = 0.25;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    [self setTitleColor:[UIColor colorNamed:@"Light Green Sea"] forState:UIControlStateNormal];
    self.titleLabel.font = [UIFont fontWithName:@"Montserrat-Medium" size:18];
    [self unhighlightBorders];

}


- (BOOL)pointInside:(CGPoint)point withEvent:(UIEvent *)event{
    return [self.path containsPoint:point];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.layer.cornerRadius];
    self.layer.shadowPath = self.path.CGPath;
}

- (void)setHighlighted:(BOOL)highlighted{
    [super setHighlighted:highlighted];
    if (highlighted) {
        [self highlightBorders];
    }
    else {
        if (!self.isSelected) {
            [self unhighlightBorders];
        }
       
    }
}
- (void) setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected){
        
        [self highlightBorders];
    }
    else {
        [self unhighlightBorders];
    }
}

- (void) highlightBorders{
    self.layer.borderColor = [UIColor colorNamed:@"Light Green Sea"].CGColor;
    self.layer.shadowColor = [UIColor colorNamed:@"Light Green Sea"].CGColor;
    self.layer.shadowRadius = 4.0;
}

- (void) unhighlightBorders{
    self.layer.borderColor =  [UIColor.blackColor colorWithAlphaComponent:0.25].CGColor;
    self.layer.shadowColor = [UIColor.blackColor colorWithAlphaComponent:0.25].CGColor;
    self.layer.shadowRadius = 2.0;
}
- (void)awakeFromNib{
    [super awakeFromNib];
    [self setupViews];
}
- (instancetype) init{
    self = [super init];
    if (self){
        [self setupViews];
    }
    return self;
}
- (void)setEnabled:(BOOL)enabled{
    self.selected = NO;
    self.highlighted = NO;
    [super setEnabled:enabled];
    if (enabled){
        self.alpha = 1;
    }
    else {
        self.alpha = 0.5;
    }
}
@end
