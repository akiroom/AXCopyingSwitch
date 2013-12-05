//
//  AXCopyingSwitch.h
//  AXCopyingSwitch
//

#import <UIKit/UIKit.h>

@interface AXCopyingSwitch : NSObject {
@private
  NSArray *_keys;
  NSArray *_blocks;
}
@property (copy, nonatomic) void(^defaultBlock)(id<NSCopying> key);
+ (id)switchWithDefault:(void(^)(id<NSCopying> key))defaultBlock
           keyAndBlocks:(id)keyAndBlocks, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithDefault:(void(^)(id<NSCopying> key))defaultBlock
         keyAndBlocks:(id)keyAndBlocks, ... NS_REQUIRES_NIL_TERMINATION;
- (id)initWithDefault:(void(^)(id<NSCopying> key))defaultBlock keyAndBlockLists:(va_list)keyAndBlockLists
             firstKey:(id)firstKey;
- (void)performByKey:(id<NSCopying>)key;
@end
