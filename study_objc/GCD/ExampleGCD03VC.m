//
//  ExampleGCD03VC.m
//  study_objc
//
//  Created by MyMacBookPro on 06/10/2019.
//  Copyright © 2019 Maverick DevStudioa. All rights reserved.
// https://www.evernote.com/l/AJx8wolL9VNGK6pNufPYnWbrtFUHSl6B3F0

#import "ExampleGCD03VC.h"

@interface ExampleGCD03VC ()

@end

@implementation ExampleGCD03VC

- (void)viewDidLoad {
    [super viewDidLoad];
 
//    [self test01];
//    [self test02];
//    [self test03];
//    [self test04];
}
-(void)test04
{ // __block 키워드를 써서, Capturing 한 변수를 수정하거나 변경사항을 공유할 수도 있습니다.
    __block int testA = 89;
    __block int testB = 91;
    
    void (^testBlock)(void) = ^{
        NSLog(@"testA is: %d", testA);
        NSLog(@"testB is: %d", testB);
        testB = 77;
        
    };
    
    testA = 4;
    testBlock();
    NSLog(@"Value of original A is now: %i", testA);
    NSLog(@"Value of original A is now: %i", testB);
}

-(void)test03
{ // 다음과 같이 같은 Lexical Scope(Enclosing Scope)에 있는 변수들을 Capturing 할 수도 있습니다.
    int testA = 89;
    
    void (^testBlock)(void) = ^{
        NSLog(@"testA is: %d", testA);
    };
    
    testA = 4;
    
    
    testBlock();
}

-(void)test02
{   // 매개변수를 받거나, 값을 반환할 수도 있습니다.
 
    NSString* (^sayHelloBlock)(NSString*, NSString*) = ^(NSString *name, NSString *country) {
        NSString *helloStr = nil;
        
        if ([country caseInsensitiveCompare:@"kr"] == NSOrderedSame) {
            helloStr = [NSString stringWithFormat:@"%@, 만나서 반갑습니다.", name];
        } else if ([country caseInsensitiveCompare:@"en"] == NSOrderedSame) {
            helloStr = [NSString stringWithFormat:@"%@, Nice to meet you.", name];
        } else {
            helloStr = [NSString stringWithFormat:@"%@, Where are you from?", name];
        }
        
        return helloStr;
    };
    
    NSLog(@"%@", sayHelloBlock(@"Panki", @"KR"));
}

-(void)test01{
    
    void (^completion)(void) = ^{
        NSLog(@"This is a Block111");
    };
    
    void (^completion2)(void) = ^{
        NSLog(@"This is a Block222");
    };
    
        // invoke
    completion();
    completion2();
}
@end
