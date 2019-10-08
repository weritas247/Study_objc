//
//  ExampleGCD01VC.m
//  study_objc
//
//  Created by MyMacBookPro on 06/10/2019.
//  Copyright © 2019 Maverick DevStudioa. All rights reserved.
//
// https://www.evernote.com/l/AJwrzC_-aeNN_6ZX7gMIBLXQTHVYEqejVdw

#import "ExampleGCD01VC.h"

NSBlockOperation* createAnOperation()
{
        // NSBlockOperation는 복수의 블록을 가질 수 있고 그것을 병렬로 실행 시킬수 있다.
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock: ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"Done: 1");
    }];
    [op addExecutionBlock: ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"Done: 2");
    }];
    [op addExecutionBlock: ^{
        [NSThread sleepForTimeInterval:2];
        NSLog(@"Done: 3");
    }];
    return op;
}

@interface ExampleGCD01VC ()

@end

@implementation ExampleGCD01VC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    NSArray *ops = @[createAnOperation(), createAnOperation()];
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    
        // 여기서 오퍼레이션을 직렬로 실행하기 위해서 오퍼레이션 동시실행수를 1로 설정
    [queue setMaxConcurrentOperationCount:1];
    
        // waitUntilFinished를YES로 하면 대기한다.
    [queue addOperations:ops waitUntilFinished:NO];
    
        // 큐에 직접 블록오퍼레이션을 추가하는 것도 가능하다.
    [queue addOperationWithBlock: ^{
        NSLog(@"All done!");
    }];
    
    
    NSLog(@"check!!!!!");
    
        // 전부 오퍼레이션이 끝날때까지 대기.
    [queue waitUntilAllOperationsAreFinished];
    
    
    NSLog(@"check@@@@@");
    
}
@end


