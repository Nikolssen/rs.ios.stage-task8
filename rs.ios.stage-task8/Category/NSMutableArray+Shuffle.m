//
//  NSMutableArray+Shuffle.m
//  rs.ios.stage-task8
//
//  Created by Admin on 20.07.2021.
//

#import "NSMutableArray+Shuffle.h"

@implementation NSMutableArray (Shuffle)
- (void)shuffle
{
    NSUInteger count = [self count];
    if (count <= 1) return;
    for (NSUInteger i = 0; i < count - 1; ++i) {
        NSInteger remainingCount = count - i;
        NSInteger exchangeIndex = i + arc4random_uniform((u_int32_t )remainingCount);
        [self exchangeObjectAtIndex:i withObjectAtIndex:exchangeIndex];
    }
}
@end
