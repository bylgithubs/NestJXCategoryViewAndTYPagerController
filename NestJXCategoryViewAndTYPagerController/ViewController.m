//
//  ViewController.m
//  NestJXCategoryViewAndTYPagerController
//
//  Created by BaoYu Liao on 2021/11/30.
//

#import "ViewController.h"
#import <JXCategoryView/JXCategoryView.h>
#import <TYPagerController/TYPagerController.h>
#import <Masonry/Masonry.h>
#import "TestViewController.h"
#import "YDNavigationSegmentBar.h"
#import <TYPagerController.h>

#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width;
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height;

@interface ViewController ()<UIScrollViewDelegate,TYPagerControllerDataSource,TYPagerControllerDelegate,JXCategoryViewDelegate,JXCategoryViewListContainer,JXCategoryListContainerViewDelegate,JXCategoryListContentViewDelegate>

@property(nonatomic, strong) UIScrollView *pageScrollView;
@property(nonatomic, strong) UIView *floatHeaderView;
@property(nonatomic, strong) TYPagerController *pagerController;
@property (nonatomic, strong) YDNavigationSegmentBar *categoryView;
//@property (nonatomic, strong) JXCategoryListContainerView *listContainerView;
@property (nonatomic, strong) NSMutableArray *dataVCArrM;
@property (nonatomic, strong) NSArray *titles;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.titles = @[@"item1",@"item2",@"item3"];
    self.dataVCArrM = @[].mutableCopy;
    [self.view addSubview:self.pageScrollView];
    //[self addChildViewController:self.pagerController];
    [self.pageScrollView addSubview:self.pagerController.view];
    [self.pageScrollView addSubview:self.floatHeaderView];
    //[self.pagerController didMoveToParentViewController:self];
    [self.view addSubview:self.categoryView];
    //[self.view addSubview:self.listContainerView];
    
    [self.pageScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(UIEdgeInsetsMake(40, 0, 0, 0));
    }];
    [self.floatHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.pageScrollView.mas_top).offset(60);
        make.height.mas_equalTo(300);
    }];
    
    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(140);
        make.left.right.mas_equalTo(self.view);
        make.height.mas_equalTo(42);
    }];

    for (int i = 0; i<self.titles.count; i++) {
        TestViewController *VC = [[TestViewController alloc] init];
        [self.dataVCArrM addObject:VC];
    }
}

- (UIViewController *)pagerController:(TYPagerController *)pagerController controllerForIndex:(NSInteger)index prefetching:(BOOL)prefetching {
    TestViewController *testVC = [[TestViewController alloc] init];
//    [self.dataVCArrM addObject:testVC];
    //TestViewController *testVC = self.dataVCArrM[index];
    return testVC;
}

- (NSInteger)numberOfControllersInPagerController {
    return 4;
}

//- (NSInteger)numberOfListsInlistContainerView:(JXCategoryListContainerView *)listContainerView {
//    return 2;
//}

- (void)setDefaultSelectedIndex:(NSInteger)index {
    //self.pagerController.defaultStartIndex = index;
}
- (UIScrollView *)contentScrollView {
    return self.pagerController.scrollView;
}


- (void)didClickSelectedItemAtIndex:(NSInteger)index {
    //[self.pagerController moveToControllerAtIndex:index animated:YES];
}

- (void)categoryView:(JXCategoryBaseView *)categoryView didSelectedItemAtIndex:(NSInteger)index {
    NSLog(@"");
}


//- (id<JXCategoryListContentViewDelegate>)listContainerView:(JXCategoryListContainerView *)listContainerView initListForIndex:(NSInteger)index {
//    TestViewController *testVC = self.dataVCArrM[index];
//    //TestViewController *testVC = [[TestViewController alloc] init];
//    return testVC;
//}


- (UIScrollView *)pageScrollView {
    if (!_pageScrollView) {
        _pageScrollView = [UIScrollView new];
        _pageScrollView.backgroundColor = [UIColor grayColor];
        _pageScrollView.delegate = self;
        _pageScrollView.clipsToBounds = YES;
        CGFloat height = [UIScreen mainScreen].bounds.size.height+300;
        CGFloat width = [UIScreen mainScreen].bounds.size.width;
        _pageScrollView.contentSize =  CGSizeMake(width, height);
    }
    return _pageScrollView;
}

- (UIView *)floatHeaderView {
    if (!_floatHeaderView) {
        _floatHeaderView = [UIView new];
        _floatHeaderView.backgroundColor = [UIColor blueColor];
        _floatHeaderView.clipsToBounds = YES;
//        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:nil];
//        [_floatHeaderView addGestureRecognizer:pan];
    }
    return _floatHeaderView;
}

- (TYPagerController *)pagerController {
    if (!_pagerController) {
        _pagerController = [[TYPagerController alloc] init];
        _pagerController.dataSource = self;
        _pagerController.delegate = self;
        _pagerController.scrollView.scrollEnabled = NO;
        //_pagerController.tabTopEdging = 0.0;
    }
    return _pagerController;
}

//- (JXCategoryListContainerView *)listContainerView {
//    if (!_listContainerView) {
//        _listContainerView = [[JXCategoryListContainerView alloc] initWithType:JXCategoryListContainerType_ScrollView delegate:self];
//    }
//    return _listContainerView;
//}

- (YDNavigationSegmentBar *)categoryView {
    if (!_categoryView) {
        _categoryView = [[YDNavigationSegmentBar alloc] init];
        _categoryView.categoryView.delegate = self;
        _categoryView.categoryView.listContainer = self;
        _categoryView.categoryView.titles = self.titles;
        //_categoryView.categoryView.contentScrollView.userInteractionEnabled = YES;
        //_categoryView.categoryView.titleColor = YD_WHITE(0.72);
        //_categoryView.categoryView.titleSelectedColor = YD_WHITE(1);
        //_categoryView.categoryView.titleFont = YDF_DEFAULT_R(16);
        //_categoryView.categoryView.titleSelectedFont = YDF_DEFAULT_B(16);
//        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
//        lineView.indicatorColor = YD_WHITE(1);
//        lineView.indicatorHeight = 2.0;
//        lineView.indicatorWidth = 20;
//        _categoryView.categoryView.indicators = @[lineView];
//        _categoryView.hideOperationButton = YES;
        _categoryView.categoryView.averageCellSpacingEnabled = YES;
//        [_categoryView yd_setLayerShadow:YD_BLACK(0.02) offset:CGSizeMake(0, 2) radius:3.0];
    }
    return _categoryView;
}

@end

