//
//  ChoiceController.h
//  rs.ios.stage-task8
//
//  Created by Admin on 18.07.2021.
//

#import <UIKit/UIKit.h>
#import "Canvas.h"
NS_ASSUME_NONNULL_BEGIN
@protocol ChoiceControllerDelegate <NSObject>
- (void) didSelectPicture: (CanvasPicture) selectedPicture;
@end

@interface ChoiceController : UIViewController
@property (nonatomic, weak) id<ChoiceControllerDelegate> delegate;
- (instancetype) initWithSelectedPicture:(CanvasPicture)  selectedPicture;
@end


NS_ASSUME_NONNULL_END
