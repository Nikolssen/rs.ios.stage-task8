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
@interface Canvas()
@property (nonatomic, strong) CanvasLayer* currentLayer;
@end

@implementation Canvas

- (void)awakeFromNib{
    [super awakeFromNib];
    [self configureLayer];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self configureLayer];
    }
    return self;
}

- (void) configureLayer{
    CanvasLayer* layer = [CanvasLayer canvasLayerHead];
    layer.color1 = UIColor.blackColor;
    layer.color2 = UIColor.blackColor;
    layer.color3 = UIColor.blackColor;
    self.currentLayer = layer;
    [self.layer addSublayer:self.currentLayer];
    
}

- (void)layoutSubviews{
    [super layoutSubviews];
    self.currentLayer.frame = self.bounds;
}
- (void)setColor1:(UIColor *)color1{
    [self.currentLayer setColor1:color1];
}

- (void)setColor2:(UIColor *)color2{
    [self.currentLayer setColor2:color2];
}

- (void)setColor3:(UIColor *)color3{
    [self.currentLayer setColor3:color3];
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
        self.currentLayer.grade = self.grade;
        
    }
}


@end
