//
//  ExampleGCD05VC.m
//  study_objc
//
//  Created by MyMacBookPro on 06/10/2019.
//  Copyright © 2019 Maverick DevStudioa. All rights reserved.
//

#import "ExampleGCD05VC.h"
#include <pthread.h>



@interface ExampleGCD05VC ()

@end

@implementation ExampleGCD05VC

- (void)viewDidLoad {
    [super viewDidLoad];
  
    
    [self test01];
    
    
}

-(void)test01
{ // 예제 1
    
    void (^logThread)(void) = ^{
        
//        NSLog(@"%@\n\n", [NSOperationQueue currentQueue]);
        NSLog(@"%@\n\n", [NSThread currentThread]);
//        mach_port_t machTID = pthread_mach_thread_np(pthread_self());
//        NSLog(@"current thread: %x", machTID);
        NSLog(@"This is a Block222");
    };
    
    
//        // 새로운 시리얼 디스패치 큐를 생성한다
//    dispatch_queue_t serialQueue = dispatch_queue_create("com.davin.serialqueue", DISPATCH_QUEUE_SERIAL);
//
//    dispatch_async(serialQueue, ^{ NSLog(@"1"); });
//    dispatch_async(serialQueue, ^{ NSLog(@"2"); });
//    dispatch_async(serialQueue, completion );
//    dispatch_async(serialQueue, logThread );
//
//
//
//        // 새로운 콘커런트 디스패치 큐를 생성한다
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.davin.concurrentqueue", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(concurrentQueue, logThread );
    
    dispatch_async(dispatch_queue_create("com.davin.concurrentqueue2", DISPATCH_QUEUE_CONCURRENT), logThread );
    dispatch_async(dispatch_queue_create("com.davin.concurrentqueue3", DISPATCH_QUEUE_CONCURRENT), logThread );
    dispatch_async(dispatch_queue_create("com.davin.concurrentqueue4", DISPATCH_QUEUE_CONCURRENT), logThread );
    
    
//        // 메인 디스패치 큐를 얻어온다
//    dispatch_queue_t mainQueue = dispatch_get_main_queue();
//    dispatch_async(mainQueue, logThread );
    
    
        // 글로벌 디스패치 큐를 얻어온다
//    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    dispatch_async(globalQueue, logThread );
}
@end
