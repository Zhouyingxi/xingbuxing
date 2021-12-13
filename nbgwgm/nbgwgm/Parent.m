//
//  Parent.m
//  nbgwgm
//
//  Created by 摇摇七喜 on 2021/11/20.
//

#import "Parent.h"

@interface Parent ()
/*
 * runtime 消息转发
 */
- (void)forwardingtar;

@end

@implementation Parent

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.‘
    
}

+ (void)classMethodA{
    NSLog(@"这是 父类 classMethodA");
}

- (void)instanceMethodA{
    NSLog(@"这是 父类 instanceMethodA");
}

+(void)load{
    NSLog(@"这是 父类 load");
}

+ (void)initialize{
    NSLog(@"这是 父类 initialize %@",[self class]);
}

#pragma mark - runtime 消息转发
- (void)forwardingtar{
    NSLog(@"消息接收者重定向成功");
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
