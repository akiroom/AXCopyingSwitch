//
//  AXAppDelegate.m
//  AXCopyingSwitchDemo
//

#import "AXAppDelegate.h"
#import <AXCopyingSwitch/AXCopyingSwitch.h>

@implementation AXAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
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
   @"test1", ^(){
     NSLog(@"test1 is comming.");
     
   }, @"test2", ^(){
     NSLog(@"test2 is comming.");
     
   }, nil];
  
  // Do switching
  for (NSString *key in sampleKeys) {
    [copyingSwtich performByKey:key];
  }
  
  exit(0);
  return YES;
}

@end
