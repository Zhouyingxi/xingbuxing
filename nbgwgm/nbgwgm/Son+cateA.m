//
//  Son+cateA.m
//  nbgwgm
//
//  Created by 摇摇七喜 on 2021/11/20.
//

#import "Son+cateA.h"

@implementation Son (cateA)
+ (void)classMethodA{
    NSLog(@"这是 子类-分类A classMethodA");
}

- (void)instanceMethodA{
    NSLog(@"这是 子类-分类A instanceMethodA");
}

+ (void)classMethodABC{
    NSLog(@"这是 子类-分类A instanceMethodABC");
}

+(void)load{
    NSLog(@"这是 子类-分类A load");
}

+ (void)initialize{
    NSLog(@"这是 子类-分类A initialize %@",[self class]);
}
@end
