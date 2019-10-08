//
//  ExampleGCD02VC.m
//  study_objc
//
//  Created by MyMacBookPro on 06/10/2019.
//  Copyright © 2019 Maverick DevStudioa. All rights reserved.
//
// https://www.evernote.com/l/AJwrzC_-aeNN_6ZX7gMIBLXQTHVYEqejVdw
// https://www.evernote.com/l/AJwNNoGGMjlCgaM8su5TL021MQyIDD4lYMk

#import "ExampleGCD02VC.h"

@interface ExampleGCD02VC ()

@end

@implementation ExampleGCD02VC

- (void)viewDidLoad {
    [super viewDidLoad];
 
    
    NSOperation *op1 = [NSBlockOperation blockOperationWithBlock: ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Done: 1");
    }];
    
    NSOperation *op2 = [NSBlockOperation blockOperationWithBlock: ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Done: 2");
    }];
    
    NSOperation *op3 = [NSBlockOperation blockOperationWithBlock: ^{
        [NSThread sleepForTimeInterval:1];
        NSLog(@"Done: 3");
    }];
    
    [op2 addDependency: op1]; // op2는 op1에 의존
    [op1 addDependency: op3]; // op1는 op3에 의존
    
    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
    [queue addOperations:@[op1, op2, op3] waitUntilFinished:NO];
    [queue waitUntilAllOperationsAreFinished];
    
}


@end
