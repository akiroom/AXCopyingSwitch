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
  va_list vl;
  va_start(vl, keyAndBlocks);
  id result = [[[self alloc] initWithDefault:defaultBlock keyAndBlockLists:vl firstKey:keyAndBlocks] autorelease];
  va_end(vl);
  return result;
}

- (id)initWithDefault:(void(^)(id<NSCopying> key))defaultBlock keyAndBlocks:(id)keyAndBlocks, ...
{
  va_list vl;
  va_start(vl, keyAndBlocks);
  id result = [[self initWithDefault:defaultBlock keyAndBlockLists:vl firstKey:keyAndBlocks] autorelease];
  va_end(vl);
  return result;
}

- (id)initWithDefault:(void(^)(id<NSCopying> key))defaultBlock keyAndBlockLists:(va_list)keyAndBlockLists firstKey:(id)firstKey
{
  if (self = [super init]) {
    _defaultBlock = [defaultBlock copy];
    
    NSMutableArray *keys = [NSMutableArray array];
    NSMutableArray *blocks = [NSMutableArray array];
    id arg;
    id<NSCopying> key = nil;
    
    arg = firstKey;
    while (arg) {
      if (key) {
        [blocks addObject:arg];
        key = nil;
      } else {
        [keys addObject:arg];
        key = arg;
      }
      arg = va_arg(keyAndBlockLists, typeof(id<NSCopying>));
    }
    _keys = keys;
    _blocks = blocks;
  }
  return self;
}

- (void)dealloc
{
  [super dealloc];
  [_keys release];
  [_blocks release];
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
