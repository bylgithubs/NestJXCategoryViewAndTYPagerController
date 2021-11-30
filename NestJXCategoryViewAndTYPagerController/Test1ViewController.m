//
//  Test1ViewController.m
//  NestMainView
//
//  Created by BaoYu Liao on 2021/11/1.
//

#import "Test1ViewController.h"

#import <Masonry/Masonry.h>

@interface Test1ViewController ()<JXCategoryListContentViewDelegate>

@end

@implementation Test1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    CGFloat c = arc4random_uniform(255)+1;
    self.title = @"2222";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0f green:arc4random_uniform(255)/255.0f blue:arc4random_uniform(255)/255.0f alpha:1.0f];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (UIView *)listView {
    return self.view;
}

@end
