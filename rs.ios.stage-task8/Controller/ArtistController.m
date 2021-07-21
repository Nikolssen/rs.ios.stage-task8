//
//  ArtistController.m
//  rs.ios.stage-task8
//
//  Created by Admin on 21.07.2021.
//

#import "ArtistController.h"
#import "RoundedButton.h"
#import "PaletteController.h"
@interface ArtistController ()<PaletteControllerDelegate, TimerControllerDelegate, DrawingsControllerDelegate>
@property (strong, nonatomic) IBOutlet Canvas *canvas;
@property (strong, nonatomic) IBOutlet RoundedButton *paletteButton;
@property (strong, nonatomic) IBOutlet RoundedButton *timerButton;
@property (strong, nonatomic) IBOutlet RoundedButton *drawButton;
@property (strong, nonatomic) IBOutlet RoundedButton *shareButton;
@property (strong, nonatomic) NSTimer* timer;
@property (assign, nonatomic) float value;
@property (copy, nonatomic) NSArray<UIColor*>* selectedColors;
@end

@implementation ArtistController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupNavigationBar];
    self.canvas.picture = self.selectedPicture;
    self.selectedColors = @[];
    self.selectedPicture = CanvasPictureHead;
    self.value = 1.0;
}

-(void)setSelectedPicture:(CanvasPicture)selectedPicture{
    if (_selectedPicture != selectedPicture){
        self.canvas.picture = selectedPicture;
    }
        _selectedPicture = selectedPicture;
    
}

- (void) setupNavigationBar{
    self.navigationItem.title = @"Artist";
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Drawings" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu:)];

    self.navigationItem.rightBarButtonItem = barButtonItem;
}

- (void) showMenu: (UIBarButtonItem*) sender{
    DrawingsController* controller = [[DrawingsController alloc] init];
   controller.delegate = self;
    controller.selectedPicture = self.selectedPicture;
    [self.navigationController pushViewController:controller animated:YES];
}
- (IBAction)openPalette:(id)sender {
    PaletteController* childVC = [PaletteController new];
    [self addChildViewController:childVC];
    childVC.delegate = self;
    childVC.view.frame = CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2 + 40);
    [self.view addSubview:childVC.view];
    [childVC didMoveToParentViewController:self];
    childVC.colors = self.selectedColors;
}

- (IBAction)openTimer:(id)sender {
    TimerController* childVC = [TimerController new];
    [self addChildViewController:childVC];
    childVC.delegate = self;
    childVC.view.frame = CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2 + 40);
    [self.view addSubview:childVC.view];
    [childVC didMoveToParentViewController:self];
    childVC.value = self.value;
    
}

- (IBAction)drawAction:(id)sender {
    [self.timer invalidate];
    self.timer = nil;
    if (self.canvas.grade >= 1.0) {
        [self reset];
    }
    else {
        self.canvas.colors = self.selectedColors;
        [self.canvas resetColors];
        [self draw];
    }
    self.drawButton.enabled = NO;
    self.paletteButton.enabled = NO;
    self.timerButton.enabled = NO;
    self.shareButton.enabled = NO;
    
}
- (IBAction)shareAction:(id)sender {
    UIGraphicsImageRenderer* imageRenderer = [[UIGraphicsImageRenderer alloc] initWithSize:self.canvas.frame.size];
    __weak typeof(self) weakSelf = self;
    UIImage* image = [imageRenderer imageWithActions:^(UIGraphicsImageRendererContext * _Nonnull rendererContext) {
        return [weakSelf.canvas.currentLayer renderInContext:rendererContext.CGContext];
    }];
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:@[image] applicationActivities:nil];
    [self presentViewController:activityVC animated:YES completion:nil];
}

- (void) reset{
    float step = 1.0/30.0;
    float interval = 1.0 /60.0;
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer timerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong  typeof(self) strongSelf = weakSelf;
        strongSelf.canvas.grade -= step;
        if (strongSelf.canvas.grade <= 0){
            [timer invalidate];
            strongSelf.timer = nil;
            [strongSelf resetState];
        }
        [strongSelf.canvas setNeedsDisplay];
    }];
    [NSRunLoop.currentRunLoop addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void) draw {
    float step = 1.0/(60.0 * self.value);
    float interval = 1.0 /60.0;
    __weak typeof(self) weakSelf = self;
    self.timer = [NSTimer timerWithTimeInterval:interval repeats:YES block:^(NSTimer * _Nonnull timer) {
        __strong  typeof(self) strongSelf = weakSelf;
        strongSelf.canvas.grade += step;
        if (strongSelf.canvas.grade >= 1.0){
            [timer invalidate];
            strongSelf.timer = nil;
            [strongSelf.drawButton setTitle:@"Reset" forState:UIControlStateNormal];
            strongSelf.drawButton.enabled = YES;
            strongSelf.paletteButton.enabled = NO;
            strongSelf.timerButton.enabled = NO;
            strongSelf.shareButton.enabled = YES;
        }
        [strongSelf.canvas setNeedsDisplay];
    }];
    [NSRunLoop.currentRunLoop addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

- (void) resetState{
    [self.drawButton setTitle:@"Draw" forState:UIControlStateNormal];
    self.drawButton.enabled = YES;
    self.paletteButton.enabled = YES;
    self.timerButton.enabled = YES;
    self.shareButton.enabled = NO;
}

- (void)paletteController:(nonnull PaletteController *)controller WillDismissWithColors:(nonnull NSArray<UIColor *> *)colors {
    self.selectedColors = colors;
    [controller willMoveToParentViewController:nil];
    [controller.view removeFromSuperview];
    [controller removeFromParentViewController];
}

- (void)didSelectPictureWithSelectedPicture:(CanvasPicture)selectedPicture{
    self.selectedPicture = selectedPicture;
    self.canvas.grade = 0.0;
    [self resetState];
}

- (void) timerController:(TimerController *)controller willDismissWithValue:(float)value{
    self.value = value;
    [controller willMoveToParentViewController:nil];
    [controller.view removeFromSuperview];
    [controller removeFromParentViewController];
}

@end
