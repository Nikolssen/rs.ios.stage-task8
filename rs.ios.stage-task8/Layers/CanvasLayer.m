//
//  CanvasLayer.m
//  rs.ios.stage-task8
//
//  Created by Ivan Budovich on 7/19/21.
//

#import "CanvasLayer.h"

@implementation CanvasLayer

- (void)setColor1:(UIColor *)color1{
    self.layers[0].strokeColor = color1.CGColor;
}
- (void)setColor2:(UIColor *)color2{
    self.layers[1].strokeColor = color2.CGColor;
}

- (void)setColor3:(UIColor *)color3{
    self.layers[2].strokeColor = color3.CGColor;
}

- (void)layoutSublayers{
    [super layoutSublayers];
    for (CAShapeLayer* layer in self.sublayers){
        layer.frame = self.bounds;
    }
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.backgroundColor = UIColor.whiteColor.CGColor;
    
    }
    return self;
}

-(void)setGrade:(float)grade{
    for (CAShapeLayer* layer in self.layers){
        if (grade <=1.0 && grade>=0){
            layer.strokeEnd = grade;
        }
    }
}
@end
