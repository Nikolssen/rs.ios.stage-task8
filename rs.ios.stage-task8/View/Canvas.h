//
//  Canvas.h
//  rs.ios.stage-task8
//
//  Created by Admin on 18.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface Canvas : UIView
typedef NS_ENUM(NSUInteger, CanvasPicture){
    CanvasPicturePlanet,
    CanvasPictureTree,
    CanvasPictureHead,
    CanvasPictureLandscape
};
@end

NS_ASSUME_NONNULL_END
