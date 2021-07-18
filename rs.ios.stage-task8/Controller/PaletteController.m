//
//  PaletteController.m
//  rs.ios.stage-task8
//
//  Created by Admin on 18.07.2021.
//

#import "PaletteController.h"
#import "ColorPanel.h"
@interface PaletteController () <ColorPanelDelegate>
@property (strong, nonatomic) IBOutlet ColorPanel *colorPanel;
@property (nonatomic, copy) NSArray <UIColor*>* colors;
@end

@implementation PaletteController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.layer.masksToBounds = NO;
    self.view.clipsToBounds = NO;
     CAShapeLayer* maskLayer = [CAShapeLayer new];
     UIBezierPath* path = [UIBezierPath bezierPathWithRoundedRect:self.view.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight cornerRadii:CGSizeMake(40, 40)];
    
    maskLayer.path = path.CGPath;
     //self.view.layer.shadowPath = path.CGPath;
    
     self.view.layer.mask = maskLayer;
    self.view.layer.borderColor =  UIColor.blackColor.CGColor;
    self.view.layer.borderWidth = 1.0;
    self.view.layer.shadowRadius = 8.0;
    self.view.layer.shadowOpacity = 0.5;
    self.view.layer.shadowOffset = CGSizeMake(0, 0);

    self.colorPanel.delegate = self;

}
- (IBAction)saveTapped:(id)sender {
    [self.delegate paletteController:self WillDismissWithColors:self.colors];
}

- (void)colorPanel:(nonnull ColorPanel *)panel didSelectColors:(nonnull NSArray<UIColor *> *)colors {
    self.colors = colors;
}


@end
