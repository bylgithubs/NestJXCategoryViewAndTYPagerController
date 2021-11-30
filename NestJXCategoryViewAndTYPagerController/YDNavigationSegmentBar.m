//
//  TopCategoryView.m
//  NestMainView
//
//  Created by BaoYu Liao on 2021/11/1.
//

#import "YDNavigationSegmentBar.h"
#import <Masonry.h>
#import "JXCategoryTitleImageView.h"
#import "JXCategoryIndicatorLineView.h"

@interface YDNavigationSegmentBar ()

@property (nonatomic, strong) JXCategoryTitleImageView *categoryView;

@end

@implementation YDNavigationSegmentBar

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initConfig];
    }
    return self;
}

- (void)initConfig {
    [self addSubview:self.categoryView];
    [self.categoryView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

- (JXCategoryTitleImageView *)categoryView {
    if (!_categoryView) {
        JXCategoryTitleImageView *categoryView = [JXCategoryTitleImageView new];
        categoryView.contentScrollViewClickTransitionAnimationEnabled = NO;
        //categoryView.contentEdgeInsetLeft = DWF(14);
        //categoryView.contentEdgeInsetRight = self.hideOperationButton ? DWF(14) : DWF(51);
        categoryView.titleColor = [UIColor blackColor];
        //categoryView.titleSelectedColor = [UIFont textBlackColor];
        //categoryView.titleFont = [UIFont textFontFitScreen:16];
        //categoryView.titleSelectedFont = [UIFont textFontFitScreen:16];
        categoryView.averageCellSpacingEnabled = NO;
        //categoryView.cellSpacing = DWF(30);
        JXCategoryIndicatorLineView *lineView = [[JXCategoryIndicatorLineView alloc] init];
        //categoryView.titles = @[@"item1",@"item2",@"item3"];
        lineView.indicatorColor = [UIColor redColor];
        lineView.indicatorHeight = 2.0;
        lineView.indicatorWidth = 20.0;
        lineView.hidden = NO;
        categoryView.indicators = @[lineView];
        _categoryView = categoryView;
        //_lineView = lineView;
    }
    return _categoryView;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
