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
    self.view.layer.cornerRadius = 40;

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
