//
//  ExampleGCD04VC.m
//  study_objc
//
//  Created by MyMacBookPro on 06/10/2019.
//  Copyright © 2019 Maverick DevStudioa. All rights reserved.
// https://www.evernote.com/l/AJx8wolL9VNGK6pNufPYnWbrtFUHSl6B3F0

#import "ExampleGCD04VC.h"

@interface ExampleGCD04VC ()

@end

@implementation ExampleGCD04VC

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    [self test01];
//    [self test02];
//    [self test03];
//    [self test04];
//    [self test05];
//    [self test06];
    [self test07];
    
    
}

-(void)test07
{ // Dispatch Group
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    dispatch_group_async(group, queue, ^{ NSLog(@"1"); });
    dispatch_group_async(group, queue, ^{ NSLog(@"2"); });
    dispatch_async(queue, ^{ NSLog(@"3"); });
    
    NSLog(@" ====== check!!");
    
    dispatch_group_notify(group, queue, ^{ NSLog(@"작업이 모두 끝났습니다."); });
    
    NSLog(@" ====== check@@");
    
    dispatch_async(queue, ^{ NSLog(@"4"); });
    dispatch_async(queue, ^{ NSLog(@"5"); });
    
    NSLog(@" ====== check##");
}

-(void)test06
{ // Dispatch Queue의 우선순위
    
    dispatch_queue_t queueHigh = dispatch_queue_create("test1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queueLow = dispatch_queue_create("test2", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t globalQueueHigh = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_set_target_queue(queueHigh, globalQueueHigh);
    
    dispatch_queue_t globalQueueLow = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_set_target_queue(queueLow, globalQueueLow);
    
    dispatch_async(queueLow, ^{ NSLog(@"1"); });
    dispatch_async(queueHigh, ^{ NSLog(@"2"); });
    dispatch_async(queueLow, ^{ NSLog(@"3"); });
    dispatch_async(queueHigh, ^{ NSLog(@"4"); });
    
}

-(void)test05
{ // Dispatch Queue에 Timer 추가
    dispatch_queue_t queue = dispatch_queue_create("test",  DISPATCH_QUEUE_SERIAL);
    
    double delayAfter = 3.0;
    dispatch_time_t pushTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayAfter * NSEC_PER_SEC));
    
    dispatch_after(pushTime, queue, ^{ NSLog(@"1"); });
    dispatch_async(queue, ^{ NSLog(@"2"); });
    dispatch_async(queue, ^{ NSLog(@"3"); });
    
}


-(void)test04
{ // -3. Async Dispatch Queue에 Async하게 Task 추가
    dispatch_queue_t concurrentQueue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_async(concurrentQueue, ^{ NSLog(@"1"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"2"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"3"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"4"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"5"); });
    dispatch_async(concurrentQueue, ^{ NSLog(@"6"); });
    
}

-(void)test03
{ // -3. Async Dispatch Queue에 Sync하게 Task 추가
    dispatch_queue_t concurrentQueue = dispatch_queue_create("test", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_sync(concurrentQueue, ^{ NSLog(@"1"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"2"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"3"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"4"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"5"); });
    dispatch_sync(concurrentQueue, ^{ NSLog(@"6"); });
    
}

-(void)test02
{ // -2. Serial Dispatch Queue에 Async하게 Task 추가
    dispatch_queue_t serialQueue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    dispatch_async(serialQueue, ^{ NSLog(@"1"); });
    dispatch_async(serialQueue, ^{ NSLog(@"2"); });
    dispatch_async(serialQueue, ^{ NSLog(@"3"); });
    dispatch_async(serialQueue, ^{ NSLog(@"4"); });
    dispatch_async(serialQueue, ^{ NSLog(@"5"); });
    dispatch_async(serialQueue, ^{ NSLog(@"6"); });
    
}

-(void)test01
{ // -1. Serial Dispatch Queue에 Sync하게 Task 추가
    
    dispatch_queue_t serialQueue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    
    dispatch_sync(serialQueue, ^{ NSLog(@"1"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"2"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"3"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"4"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"5"); });
    dispatch_sync(serialQueue, ^{ NSLog(@"6"); });
    
}

@end
