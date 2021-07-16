//
//  ColorButton.m
//  rs.ios.stage-task8
//
//  Created by Admin on 16.07.2021.
//

#import "ColorButton.h"
@interface ColorButton()
@property (nonatomic, strong) CALayer* internalLayer;
@end
@implementation ColorButton

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configure];
    }
    return self;
}

-(void) configure{
    self.layer.masksToBounds = NO;
    self.layer.borderWidth = 1.0;
    self.layer.cornerRadius = 10.0;
    self.backgroundColor = UIColor.whiteColor;
    self.layer.shadowRadius = 2.0;
    self.layer.shadowOpacity = 0.25;
    self.layer.shadowOffset = CGSizeMake(0, 0);
    self.layer.borderColor =  [UIColor.blackColor colorWithAlphaComponent:0.25].CGColor;
    self.layer.shadowColor = [UIColor.blackColor colorWithAlphaComponent:0.25].CGColor;
    self.internalLayer = [CALayer new];
    self.internalLayer.frame = CGRectMake(0, 0, 24, 24);
    [self.layer addSublayer: self.internalLayer];
    self.internalLayer.cornerRadius = 6.0;
    self.internalLayer.backgroundColor = self.keyColor.CGColor;
}

- (void)setKeyColor:(UIColor *)keyColor{
    _keyColor = keyColor;
    self.internalLayer.backgroundColor = keyColor.CGColor;
}

- (void)layoutSubviews{
    CGRect frame = self.internalLayer.frame;
    frame.origin.x = (self.layer.bounds.size.width - frame.size.width) /2;
    frame.origin.y = (self.layer.bounds.size.height - frame.size.height) /2;
    self.internalLayer.frame = frame;
}

- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (selected){
        self.internalLayer.cornerRadius = 8.0;
        CGRect frame = self.internalLayer.frame;
        frame.size.height = 36;
        frame.size.width = 36;
        self.internalLayer.frame = frame;
    }
    else {
        self.internalLayer.cornerRadius = 6.0;
        CGRect frame = self.internalLayer.frame;
        frame.size.height = 24;
        frame.size.width = 24;
        self.internalLayer.frame = frame;
    }
    
    [self layoutSubviews];
}

- (void)awakeFromNib{
    [super awakeFromNib];
    [self configure];
}


@end
