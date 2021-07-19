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
@property (nonatomic, strong) NSTimer* timer;
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
- (void)setColors:(NSArray<UIColor *> *)colors{
    [self.colorPanel activateColors:colors];
    _colors = colors;
}
- (IBAction)saveTapped:(id)sender {
    [self.delegate paletteController:self WillDismissWithColors:self.colors];
}

- (void)colorPanel:(nonnull ColorPanel *)panel didSelectColors:(nonnull NSArray<UIColor *> *)colors {
    _colors = colors;
    
    [self.timer invalidate];
    self.timer = nil;
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer timerWithTimeInterval:1.0 repeats:NO block:^(NSTimer * _Nonnull timer) {
        weakSelf.view.backgroundColor = weakSelf.colors.lastObject;
        [timer invalidate];
        weakSelf.timer = nil;
    }];
    NSRunLoop* runloop = NSRunLoop.currentRunLoop;
    [runloop addTimer:self.timer forMode:NSDefaultRunLoopMode];
    
}


@end
