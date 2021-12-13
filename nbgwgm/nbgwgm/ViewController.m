//
//  ViewController.m
//  nbgwgm
//
//  Created by 摇摇七喜 on 2021/11/18.
//

#import "ViewController.h"
#import "Son.h"
#import "Son+cate.h"
#include <objc/runtime.h>

@interface ViewController ()

//- (void)rtMethod;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     * category
     */
    UIButton *button = [[UIButton alloc]initWithFrame:CGRectMake(0, 100, 100, 50)];
    button.backgroundColor = [UIColor grayColor];
    [button addTarget:self action:@selector(butClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    /*
     * runtime 消息转发
     */
    [self performSelector:  @selector(rtMethod)];
    
}

#pragma mark  category
- (void)butClick{
    [Son classMethodA];
//    [Son new];
//    Son *son = [[Son alloc] init];
//    [son instanceMethodA];
//    NSLog(@"这是方法A");
}

#pragma mark runtime 消息转发

//- (void)rtMethod{
//    NSLog(@" 消息重定向 rtMethod");
//}

+ (BOOL)resolveInstanceMethod:(SEL)sel{
//    if (sel == @selector(rtMethod)) {
//        class_addMethod([self class], sel, class_getMethodImplementation(self, @selector(newMethod)), "v@:");
//        return YES;
//    }
//    return [super resolveInstanceMethod:sel];
    return YES;//为了进行下一步 消息接收者重定向
}

- (void)newMethod{
    NSLog(@"newMethod");
}

- (id)forwardingTargetForSelector:(SEL)aSelector{
//    if (aSelector == @selector(rtMethod)) {
//        //返回son 让son来接受这个消息
//        return [[Son alloc] init];
//    }
//    return [super forwardingTargetForSelector:aSelector];
    return nil;//为了进行下一步消息重定向
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    if ([NSStringFromSelector(aSelector) isEqualToString:@"rtMethod"]) {
        return [NSMethodSignature signatureWithObjCTypes:"v@:"];
    }
    return [super methodSignatureForSelector:aSelector];
}

/*
 * -forwardingTargetForSelector: 和 -forwardInvocation: 都可以将消息转发给其他对象处理，那么两者的区别在哪？
 * -forwardingTargetForSelector: 只能将消息转发给一个对象。而 -forwardInvocation: 可以将消息转发给多个对象。
 */
- (void)forwardInvocation:(NSInvocation *)anInvocation{
    SEL sel = anInvocation.selector; //从anInvocation中获取消息
    Son *son = [[Son alloc] init];
    if ([son respondsToSelector:sel]) { //判断son是否可以响应sel
        [anInvocation invokeWithTarget:son]; //可以响应 将消息转发给其他对象处理
    }else{//不可以响应 报错 找不到响应方法
        [self doesNotRecognizeSelector:sel];
    }
}


@end
