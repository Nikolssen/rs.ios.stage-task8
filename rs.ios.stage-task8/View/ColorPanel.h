//
//  ColorPanel.h
//  rs.ios.stage-task8
//
//  Created by Admin on 16.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ColorPanel;


@protocol ColorPanelDelegate <NSObject>

- (void) colorPanel:(ColorPanel*) panel didSelectColors: (NSArray<UIColor*>*) colors;

@end

@interface ColorPanel : UIView
@property (weak, nonatomic) id<ColorPanelDelegate> delegate;
- (void) activateColors: (NSArray<UIColor*>*) colors;
@end
NS_ASSUME_NONNULL_END
