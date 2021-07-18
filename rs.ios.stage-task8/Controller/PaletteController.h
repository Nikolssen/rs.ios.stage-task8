//
//  PaletteController.h
//  rs.ios.stage-task8
//
//  Created by Admin on 18.07.2021.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class PaletteController;
@protocol PaletteControllerDelegate <NSObject>

-(void) paletteController:(PaletteController*) controller WillDismissWithColors:(NSArray<UIColor*>*) colors;

@end

@interface PaletteController : UIViewController
@property (nonatomic, weak) id<PaletteControllerDelegate> delegate;
@end


NS_ASSUME_NONNULL_END
