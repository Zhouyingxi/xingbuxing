//
//  Parent+cate.m
//  nbgwgm
//
//  Created by 摇摇七喜 on 2021/11/20.
//

#import "Parent+cate.h"

@implementation Parent (cate)

//+ (void)methodA{
//    NSLog(@"这是 父类-分类 方法A");
//}

+ (void)classMethodA{
    NSLog(@"这是 父类-分类 classMethodA");
}

- (void)instanceMethodA{
    NSLog(@"这是 父类-分类 instanceMethodA");
}

+(void)load{
    NSLog(@"这是 父类-分类 load");
}

+ (void)initialize{
    NSLog(@"这是 父类-分类 initialize %@",[self class]);
}

@end
