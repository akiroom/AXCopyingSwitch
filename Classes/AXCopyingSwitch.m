//
//  AXCopyingSwitch.m
//  AXCopyingSwitch
//

#import "AXCopyingSwitch.h"

@interface AXCopyingSwitch ()

@end

@implementation AXCopyingSwitch

+ (id)switchWithDefault:(void(^)(id<NSCopying> key))defaultBlock keyAndBlocks:(id)keyAndBlocks, ...
{
  return [[self alloc] initWithDefault:defaultBlock keyAndBlocks:keyAndBlocks, nil];
}

- (id)initWithDefault:(void(^)(id<NSCopying> key))defaultBlock keyAndBlocks:(id)keyAndBlocks, ...
{
  if (self = [super init]) {
    _defaultBlock = [defaultBlock copy];
    
    NSMutableArray *keys = [NSMutableArray array];
    NSMutableArray *blocks = [NSMutableArray array];
    id arg;
    id<NSCopying> key;
    
    va_list arguments;
    va_start(arguments, keyAndBlocks);
    arg = keyAndBlocks;
    
    while (arg) {
      if (key) {
        [blocks addObject:arg];
        key = nil;
      } else {
        [keys addObject:arg];
        key = arg;
      }
      arg = va_arg(arguments, typeof(NSString*));
    }
    _keys = keys;
    _blocks = blocks;
    va_end(arguments);
  }
  return self;
}

- (void)performByKey:(id<NSCopying>)key
{
  NSUInteger index = [_keys indexOfObject:key];
  if (index == NSNotFound) {
    _defaultBlock(key);
  } else {
   ((void(^)())_blocks[index])();
  }
}

@end
