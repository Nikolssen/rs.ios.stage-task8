//
//  CanvasLayer+Tree.m
//  rs.ios.stage-task8
//
//  Created by Admin on 19.07.2021.
//

#import "CanvasLayer+Tree.h"

@implementation CanvasLayer (Tree)
+ (instancetype) canvasLayerTree{
    CanvasLayer* layer = [[CanvasLayer alloc] init];
    UIBezierPath* bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint: CGPointMake(102.25, 243.25)];
    [bezierPath addCurveToPoint: CGPointMake(68.75, 248.56) controlPoint1: CGPointMake(94.25, 234.75) controlPoint2: CGPointMake(79.15, 235.36)];
    [bezierPath moveToPoint: CGPointMake(42.25, 254.75)];
    [bezierPath addCurveToPoint: CGPointMake(66.25, 247.75) controlPoint1: CGPointMake(45.58, 250.92) controlPoint2: CGPointMake(55.05, 244.15)];
    [bezierPath addCurveToPoint: CGPointMake(76.75, 251.75) controlPoint1: CGPointMake(77.45, 251.35) controlPoint2: CGPointMake(77.92, 251.92)];
    [bezierPath moveToPoint: CGPointMake(180.75, 240.25)];
    [bezierPath addCurveToPoint: CGPointMake(204.25, 240.25) controlPoint1: CGPointMake(185.75, 237.48) controlPoint2: CGPointMake(197.45, 233.6)];
    [bezierPath addCurveToPoint: CGPointMake(209.49, 246.25) controlPoint1: CGPointMake(206.53, 242.48) controlPoint2: CGPointMake(208.23, 244.49)];
    [bezierPath moveToPoint: CGPointMake(212.75, 253.25)];
    [bezierPath addCurveToPoint: CGPointMake(209.49, 246.25) controlPoint1: CGPointMake(212.75, 252.21) controlPoint2: CGPointMake(212, 249.74)];
    [bezierPath moveToPoint: CGPointMake(209.49, 246.25)];
    [bezierPath addCurveToPoint: CGPointMake(244.25, 247.75) controlPoint1: CGPointMake(221.08, 243.08) controlPoint2: CGPointMake(244.25, 238.95)];
    [bezierPath addCurveToPoint: CGPointMake(227.25, 255.75) controlPoint1: CGPointMake(244.25, 256.55) controlPoint2: CGPointMake(228.58, 254.92)];
    bezierPath.miterLimit = 4;
    bezierPath.lineCapStyle = kCGLineCapRound;
    CAShapeLayer* layer1 = [CAShapeLayer new];
    layer1.fillColor = [UIColor.whiteColor colorWithAlphaComponent:0.0].CGColor;
    layer1.path = bezierPath.CGPath;
    layer1.lineWidth = 0.5;
    
    UIBezierPath* bezier2Path = [UIBezierPath bezierPath];
    [bezier2Path moveToPoint: CGPointMake(82, 250.5)];
    [bezier2Path addCurveToPoint: CGPointMake(143.5, 187.5) controlPoint1: CGPointMake(101.83, 244.67) controlPoint2: CGPointMake(141.9, 223.9)];
    [bezier2Path addCurveToPoint: CGPointMake(133.5, 140.5) controlPoint1: CGPointMake(145.1, 151.1) controlPoint2: CGPointMake(137.5, 141)];
    [bezier2Path moveToPoint: CGPointMake(225.5, 256)];
    [bezier2Path addCurveToPoint: CGPointMake(172, 227) controlPoint1: CGPointMake(207.17, 255) controlPoint2: CGPointMake(170.8, 247.8)];
    [bezier2Path addCurveToPoint: CGPointMake(183, 168.5) controlPoint1: CGPointMake(173.2, 206.2) controlPoint2: CGPointMake(179.83, 179.33)];
    [bezier2Path addCurveToPoint: CGPointMake(192.5, 156.5) controlPoint1: CGPointMake(185.17, 164.17) controlPoint2: CGPointMake(190.1, 155.7)];
    [bezier2Path moveToPoint: CGPointMake(158.5, 165)];
    [bezier2Path addCurveToPoint: CGPointMake(151, 214) controlPoint1: CGPointMake(157, 180.17) controlPoint2: CGPointMake(153.4, 211.2)];
    [bezier2Path moveToPoint: CGPointMake(163.5, 239.5)];
    [bezier2Path addCurveToPoint: CGPointMake(168.5, 168.5) controlPoint1: CGPointMake(163.5, 231.5) controlPoint2: CGPointMake(162.5, 183)];
    [bezier2Path moveToPoint: CGPointMake(145, 207.5)];
    [bezier2Path addCurveToPoint: CGPointMake(124.5, 236.5) controlPoint1: CGPointMake(132, 226.5) controlPoint2: CGPointMake(130.5, 231)];
    bezier2Path.miterLimit = 4;
    bezier2Path.lineCapStyle = kCGLineCapRound;
    CAShapeLayer* layer2 = [CAShapeLayer new];
    layer2.fillColor = [UIColor.whiteColor colorWithAlphaComponent:0.0].CGColor;
    layer2.path = bezier2Path.CGPath;
    
    UIBezierPath* bezier3Path = [UIBezierPath bezierPath];
    [bezier3Path moveToPoint: CGPointMake(213.19, 65.76)];
    [bezier3Path addCurveToPoint: CGPointMake(217, 56.5) controlPoint1: CGPointMake(215.57, 63.25) controlPoint2: CGPointMake(217, 60.02)];
    [bezier3Path addCurveToPoint: CGPointMake(200.5, 42) controlPoint1: CGPointMake(217, 48.49) controlPoint2: CGPointMake(209.61, 42)];
    [bezier3Path addCurveToPoint: CGPointMake(195.97, 42.55) controlPoint1: CGPointMake(198.93, 42) controlPoint2: CGPointMake(197.41, 42.19)];
    [bezier3Path addCurveToPoint: CGPointMake(179.5, 29) controlPoint1: CGPointMake(195.41, 34.99) controlPoint2: CGPointMake(188.25, 29)];
    [bezier3Path addCurveToPoint: CGPointMake(171.6, 30.77) controlPoint1: CGPointMake(176.64, 29) controlPoint2: CGPointMake(173.94, 29.64)];
    [bezier3Path addCurveToPoint: CGPointMake(160.5, 27) controlPoint1: CGPointMake(168.67, 28.43) controlPoint2: CGPointMake(164.77, 27)];
    [bezier3Path addCurveToPoint: CGPointMake(155.97, 27.55) controlPoint1: CGPointMake(158.93, 27) controlPoint2: CGPointMake(157.41, 27.19)];
    [bezier3Path addCurveToPoint: CGPointMake(139.5, 14) controlPoint1: CGPointMake(155.41, 19.99) controlPoint2: CGPointMake(148.25, 14)];
    [bezier3Path addCurveToPoint: CGPointMake(125.59, 20.7) controlPoint1: CGPointMake(133.65, 14) controlPoint2: CGPointMake(128.52, 16.67)];
    [bezier3Path addCurveToPoint: CGPointMake(120.5, 20) controlPoint1: CGPointMake(123.98, 20.25) controlPoint2: CGPointMake(122.28, 20)];
    [bezier3Path addCurveToPoint: CGPointMake(110.81, 22.77) controlPoint1: CGPointMake(116.88, 20) controlPoint2: CGPointMake(113.53, 21.03)];
    [bezier3Path addCurveToPoint: CGPointMake(105.5, 22) controlPoint1: CGPointMake(109.14, 22.27) controlPoint2: CGPointMake(107.36, 22)];
    [bezier3Path addCurveToPoint: CGPointMake(91.59, 28.7) controlPoint1: CGPointMake(99.65, 22) controlPoint2: CGPointMake(94.52, 24.67)];
    [bezier3Path addCurveToPoint: CGPointMake(86.5, 28) controlPoint1: CGPointMake(89.98, 28.25) controlPoint2: CGPointMake(88.28, 28)];
    [bezier3Path addCurveToPoint: CGPointMake(70, 42.5) controlPoint1: CGPointMake(77.39, 28) controlPoint2: CGPointMake(70, 34.49)];
    [bezier3Path addCurveToPoint: CGPointMake(70.01, 43.02) controlPoint1: CGPointMake(70, 42.68) controlPoint2: CGPointMake(70, 42.85)];
    [bezier3Path addCurveToPoint: CGPointMake(68.59, 44.7) controlPoint1: CGPointMake(69.49, 43.55) controlPoint2: CGPointMake(69.02, 44.11)];
    [bezier3Path addCurveToPoint: CGPointMake(63.5, 44) controlPoint1: CGPointMake(66.98, 44.25) controlPoint2: CGPointMake(65.28, 44)];
    [bezier3Path addCurveToPoint: CGPointMake(47, 58.5) controlPoint1: CGPointMake(54.39, 44) controlPoint2: CGPointMake(47, 50.49)];
    [bezier3Path addCurveToPoint: CGPointMake(48.58, 64.71) controlPoint1: CGPointMake(47, 60.72) controlPoint2: CGPointMake(47.57, 62.83)];
    [bezier3Path addCurveToPoint: CGPointMake(46, 72.5) controlPoint1: CGPointMake(46.95, 66.96) controlPoint2: CGPointMake(46, 69.63)];
    [bezier3Path addCurveToPoint: CGPointMake(47.19, 77.92) controlPoint1: CGPointMake(46, 74.42) controlPoint2: CGPointMake(46.42, 76.25)];
    [bezier3Path addCurveToPoint: CGPointMake(44, 86.5) controlPoint1: CGPointMake(45.19, 80.33) controlPoint2: CGPointMake(44, 83.29)];
    [bezier3Path addCurveToPoint: CGPointMake(45.58, 92.71) controlPoint1: CGPointMake(44, 88.72) controlPoint2: CGPointMake(44.57, 90.83)];
    [bezier3Path addCurveToPoint: CGPointMake(43, 100.5) controlPoint1: CGPointMake(43.95, 94.96) controlPoint2: CGPointMake(43, 97.63)];
    [bezier3Path addCurveToPoint: CGPointMake(59.5, 115) controlPoint1: CGPointMake(43, 108.51) controlPoint2: CGPointMake(50.39, 115)];
    [bezier3Path addCurveToPoint: CGPointMake(61.68, 114.88) controlPoint1: CGPointMake(60.24, 115) controlPoint2: CGPointMake(60.96, 114.96)];
    [bezier3Path addCurveToPoint: CGPointMake(76.5, 123) controlPoint1: CGPointMake(64.36, 119.69) controlPoint2: CGPointMake(69.99, 123)];
    [bezier3Path addCurveToPoint: CGPointMake(84.35, 121.26) controlPoint1: CGPointMake(79.34, 123) controlPoint2: CGPointMake(82.02, 122.37)];
    [bezier3Path addCurveToPoint: CGPointMake(99.5, 130) controlPoint1: CGPointMake(86.89, 126.4) controlPoint2: CGPointMake(92.71, 130)];
    [bezier3Path addCurveToPoint: CGPointMake(101.68, 129.88) controlPoint1: CGPointMake(100.24, 130) controlPoint2: CGPointMake(100.96, 129.96)];
    [bezier3Path addCurveToPoint: CGPointMake(116.5, 138) controlPoint1: CGPointMake(104.36, 134.69) controlPoint2: CGPointMake(109.99, 138)];
    [bezier3Path addCurveToPoint: CGPointMake(125, 135.93) controlPoint1: CGPointMake(119.61, 138) controlPoint2: CGPointMake(122.52, 137.24)];
    [bezier3Path addCurveToPoint: CGPointMake(129.66, 137.6) controlPoint1: CGPointMake(126.43, 136.69) controlPoint2: CGPointMake(127.99, 137.26)];
    [bezier3Path addCurveToPoint: CGPointMake(142.5, 143) controlPoint1: CGPointMake(132.68, 140.9) controlPoint2: CGPointMake(137.31, 143)];
    [bezier3Path addCurveToPoint: CGPointMake(150.35, 141.26) controlPoint1: CGPointMake(145.34, 143) controlPoint2: CGPointMake(148.02, 142.37)];
    [bezier3Path addCurveToPoint: CGPointMake(165.5, 150) controlPoint1: CGPointMake(152.89, 146.4) controlPoint2: CGPointMake(158.72, 150)];
    [bezier3Path addCurveToPoint: CGPointMake(167.68, 149.88) controlPoint1: CGPointMake(166.24, 150) controlPoint2: CGPointMake(166.96, 149.96)];
    [bezier3Path addCurveToPoint: CGPointMake(182.5, 158) controlPoint1: CGPointMake(170.36, 154.69) controlPoint2: CGPointMake(175.99, 158)];
    [bezier3Path addCurveToPoint: CGPointMake(191, 155.93) controlPoint1: CGPointMake(185.61, 158) controlPoint2: CGPointMake(188.52, 157.24)];
    [bezier3Path addCurveToPoint: CGPointMake(199.5, 158) controlPoint1: CGPointMake(193.48, 157.24) controlPoint2: CGPointMake(196.39, 158)];
    [bezier3Path addCurveToPoint: CGPointMake(216, 143.5) controlPoint1: CGPointMake(208.61, 158) controlPoint2: CGPointMake(216, 151.51)];
    [bezier3Path addCurveToPoint: CGPointMake(215.99, 142.99) controlPoint1: CGPointMake(216, 143.33) controlPoint2: CGPointMake(216, 143.16)];
    [bezier3Path addCurveToPoint: CGPointMake(216.5, 143) controlPoint1: CGPointMake(216.16, 143) controlPoint2: CGPointMake(216.33, 143)];
    [bezier3Path addCurveToPoint: CGPointMake(225, 140.93) controlPoint1: CGPointMake(219.61, 143) controlPoint2: CGPointMake(222.52, 142.24)];
    [bezier3Path addCurveToPoint: CGPointMake(233.5, 143) controlPoint1: CGPointMake(227.48, 142.24) controlPoint2: CGPointMake(230.39, 143)];
    [bezier3Path addCurveToPoint: CGPointMake(250, 128.5) controlPoint1: CGPointMake(242.61, 143) controlPoint2: CGPointMake(250, 136.51)];
    [bezier3Path addCurveToPoint: CGPointMake(249.66, 125.56) controlPoint1: CGPointMake(250, 127.49) controlPoint2: CGPointMake(249.88, 126.51)];
    [bezier3Path addCurveToPoint: CGPointMake(257, 113.5) controlPoint1: CGPointMake(254.09, 122.96) controlPoint2: CGPointMake(257, 118.53)];
    [bezier3Path addCurveToPoint: CGPointMake(253.19, 104.23) controlPoint1: CGPointMake(257, 109.98) controlPoint2: CGPointMake(255.57, 106.75)];
    [bezier3Path addCurveToPoint: CGPointMake(260, 92.5) controlPoint1: CGPointMake(257.32, 101.6) controlPoint2: CGPointMake(260, 97.33)];
    [bezier3Path addCurveToPoint: CGPointMake(243.5, 78) controlPoint1: CGPointMake(260, 84.49) controlPoint2: CGPointMake(252.61, 78)];
    [bezier3Path addCurveToPoint: CGPointMake(238.97, 78.55) controlPoint1: CGPointMake(241.93, 78) controlPoint2: CGPointMake(240.41, 78.19)];
    [bezier3Path addCurveToPoint: CGPointMake(222.5, 65) controlPoint1: CGPointMake(238.41, 70.99) controlPoint2: CGPointMake(231.25, 65)];
    [bezier3Path addCurveToPoint: CGPointMake(214.6, 66.77) controlPoint1: CGPointMake(219.64, 65) controlPoint2: CGPointMake(216.94, 65.64)];
    [bezier3Path addCurveToPoint: CGPointMake(213.19, 65.76) controlPoint1: CGPointMake(214.15, 66.41) controlPoint2: CGPointMake(213.68, 66.08)];
    CAShapeLayer* layer3 = [CAShapeLayer new];
    layer3.fillColor = [UIColor.whiteColor colorWithAlphaComponent:0.0].CGColor;
    layer3.path = bezier3Path.CGPath;
    layer.layers = @[layer1, layer2, layer3];
    [layer addSublayer:layer1];
    [layer addSublayer:layer2];
    [layer addSublayer:layer3];
    
    
    
    
    return layer;
}
@end
