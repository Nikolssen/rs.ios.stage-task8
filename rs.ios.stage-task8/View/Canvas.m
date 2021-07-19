//
//  Canvas.m
//  rs.ios.stage-task8
//
//  Created by Admin on 18.07.2021.
//

#import "Canvas.h"
#import "CanvasLayer.h"
#import "CanvasLayer+Head.h"
#import "CanvasLayer+Planet.h"
#import "CanvasLayer+Landscape.h"
#import "CanvasLayer+Tree.h"
#import "NSMutableArray+Shuffle.h"

@interface Canvas()
@property (nonatomic, strong) CanvasLayer* currentLayer;
@end

@implementation Canvas

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
    }
    return self;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.currentLayer.frame = self.bounds;
}

-(void)resetColors{
    NSMutableArray* colors = [self.colors mutableCopy];
    if (colors.count < 3) {
        while (colors.count != 3){
            [colors addObject:UIColor.blackColor];
        }
    }
    [colors shuffle];
    [self.currentLayer setColor1:colors[0]];
    [self.currentLayer setColor2:colors[1]];
    [self.currentLayer setColor3:colors[2]];
    
}
- (void) setGrade:(float)grade{
    _grade = grade;
    self.currentLayer.grade = grade;
}
- (void) setPicture:(CanvasPicture)picture{
    if (_picture != picture){
        [self.currentLayer removeFromSuperlayer];
        self.currentLayer = nil;
        _picture = picture;
        switch (picture) {
            case CanvasPictureHead:
                self.currentLayer = [CanvasLayer canvasLayerHead];
                break;
            case CanvasPicturePlanet:
                self.currentLayer = [CanvasLayer canvasLayerPlanet];
                break;
            case CanvasPictureLandscape:
                self.currentLayer = [CanvasLayer canvasLayerLandscape];
                break;
            case CanvasPictureTree:
                self.currentLayer = [CanvasLayer canvasLayerTree];
        }
        [self.layer addSublayer:self.currentLayer];
        self.currentLayer.grade = 0;
        self.currentLayer.color1 = UIColor.blackColor;
        self.currentLayer.color2 = UIColor.blackColor;
        self.currentLayer.color3 = UIColor.blackColor;
    }
}


@end
