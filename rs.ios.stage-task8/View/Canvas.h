//
//  Canvas.h
//  rs.ios.stage-task8
//
//  Created by Admin on 18.07.2021.
//

#import <UIKit/UIKit.h>
#import "CanvasLayer.h"
NS_ASSUME_NONNULL_BEGIN

@interface Canvas : UIView
typedef NS_ENUM(NSUInteger, CanvasPicture){
    CanvasPicturePlanet,
    CanvasPictureHead,
    CanvasPictureTree,
    CanvasPictureLandscape
};

@property (nonatomic, assign) CanvasPicture picture;
@property (nonatomic, assign) float grade;
@property (nonatomic, strong) NSArray* colors;

- (void) resetColors;
@end

NS_ASSUME_NONNULL_END
