AXCopyingSwitch
===============

like a switch statement with NSCopying protocol.

Example1
--------

```objc
  NSString *key = @"test";
  [[AXCopyingSwitch switchWithDefault:^(id<NSCopying> key) {
    NSLog(@"Default.");
  } keyAndBlocks:
    @"test", ^{
      NSLog(@"test");
    }, @"test2", ^{
      NSLog(@"test2");
    }, nil] performByKey:key];
```

Example2
--------

```objc
  // Generate sample keys(NSString).
  NSMutableArray *sampleKeys = [NSMutableArray array];
  for (int i = 1; i < 30; i++) {
    NSString *key = [NSString stringWithFormat:@"test%d", rand() % i];
    [sampleKeys addObject:key];
  }
  
  // Instantiate switch object.
  AXCopyingSwitch *copyingSwtich =
  [[AXCopyingSwitch alloc] initWithDefault:^(NSString *key){
    NSLog(@"Default: Key is %@", key);
    
  } keyAndBlocks:
   @"test1", ^{
     NSLog(@"test1 is comming.");
     
   }, @"test2", ^{
     NSLog(@"test2 is comming.");
     
   }, nil];
  
  // Do switching
  for (NSString *key in sampleKeys) {
    [copyingSwtich performByKey:key];
  }
```
