//
//  TestViewController.m
//  NestMainView
//
//  Created by BaoYu Liao on 2021/10/29.
//

#import "TestViewController.h"
#import <TYPagerController/TYPagerController.h>
#import <Masonry/Masonry.h>
#import "YDNavigationSegmentBar.h"
#import <TYPagerController.h>
#import "Test1ViewController.h"

@interface TestViewController ()<JXCategoryViewDelegate,JXCategoryListContainerViewDelegate>

@property (nonatomic, strong) JXCategoryTitleView *titleView;
@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;

@end

@implementation TestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.title = @"11111";
    self.view.backgroundColor = [UIColor colorWithRed:arc4random_uniform(255)/255.0f green:arc4random_uniform(255)/255.0f blue:arc4random_uniform(255)/255.0f alpha:1.0f];
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    [self.view addSubview:self.titleView];
    //self.titleView.frame = CGRectMake(0, 400, width, 60);
    [self.titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(400);
        make.left.equalTo(self.view);
        make.width.mas_equalTo(width);
        //make.left.right.equalTo(self.view);
        make.height.mas_equalTo(60);
    }];
    [self.view addSubview:self.listContainerView];
    [self.listContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleView.mas_bottom);
        make.left.right.bottom.equalTo(self.view);
    }];
}

- (UIView *)listView {
    return self.view;
}

- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
    return self.titleView.titles.count;
}

- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
    Test1ViewController *vc = [[Test1ViewController alloc] init];
    return vc;
}

- (JXCategoryListContainerView *)listContainerView {
    if (!_listContainerView) {
        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
    }
    return _listContainerView;
}

-(JXCategoryTitleView *)titleView {
    if (!_titleView) {
        //NSMutableArray *titles = @[@"附近排行", @"好友排行"].mutableCopy;
        _titleView = [[JXCategoryTitleView alloc] init];
        _titleView.backgroundColor = [UIColor orangeColor];
        _titleView.contentScrollViewClickTransitionAnimationEnabled = NO;
        _titleView.contentEdgeInsetLeft = 0;
        _titleView.contentEdgeInsetRight = 0;
        _titleView.cellSpacing = 0;
        //_titleView.cellWidth = SCREEN_WIDTH_V0 / (titles.count * 1.f);
        _titleView.titleColor = [UIColor blueColor];
        //_titleView.titleSelectedColor = [UIFont textBlackColor];
        //_titleView.titleFont = YDF_DEFAULT_R(16);
       // _titleView.titleSelectedFont = YDF_DEFAULT_B(16);
        _titleView.titles = @[@"区域榜",@"英雄榜",@"item1",@"item2",@"item3"];
        _titleView.listContainer = self.listContainerView;
//        _titleView.contentScrollView.scrollEnabled = YES;
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        lineView.indicatorColor = [UIColor redColor];
        lineView.indicatorHeight = 2.0;
        lineView.indicatorWidth = 20;
        _titleView.indicators = @[lineView];
        _titleView.delegate = self;
    }
    return _titleView;
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
