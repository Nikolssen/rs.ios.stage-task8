//
//  CanvasLayer.h
//  rs.ios.stage-task8
//
//  Created by Ivan Budovich on 7/19/21.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>
NS_ASSUME_NONNULL_BEGIN

@interface CanvasLayer : CALayer
- (void)setColor1:(UIColor *)color1;

- (void)setColor2:(UIColor *)color2;

- (void)setColor3:(UIColor *)color3;

@property (nonatomic, assign) float grade;
@property (nonatomic, copy) NSArray<CAShapeLayer*>* layers;
@end

NS_ASSUME_NONNULL_END
