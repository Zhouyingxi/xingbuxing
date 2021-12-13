//
//  Parent+cateA.m
//  nbgwgm
//
//  Created by 摇摇七喜 on 2021/11/20.
//

#import "Parent+cateA.h"

@implementation Parent (cateA)
+ (void)classMethodA{
    NSLog(@"这是 父类-分类A classMethodA");
}

- (void)instanceMethodA{
    NSLog(@"这是 父类-分类A instanceMethodA");
}

+(void)load{
    NSLog(@"这是 父类-分类A load");
}
@end
