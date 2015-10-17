//
//  PageViewController.m
//  KMSegmentedPagerDemo
//
//  Created by IM049 on 2015. 10. 17..
//  Copyright © 2015년 Dalkomm. All rights reserved.
//

#import "PageViewController.h"
#import "TableViewController.h"

@interface PageViewController ()<KMPageViewDataSource,KMPageViewDelegate,KMSegmentedBarDataSource,KMSegmentedBarDelegate>

@property (nonatomic,strong) KMSegmentedBar *segmentedBar;

@property (nonatomic,strong) TableViewController *table1;
@property (nonatomic,strong) TableViewController *table2;
@property (nonatomic,strong) TableViewController *table3;

@end

@implementation PageViewController

#pragma mark - memory

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - viwe lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.segmentedBar = [[KMSegmentedBar alloc] init];
    self.segmentedBar.backgroundColor = [UIColor darkGrayColor];
    self.segmentedBar.titleColor = [UIColor blackColor];
    self.segmentedBar.highlightedTitleColor = [UIColor whiteColor];
    self.segmentedBar.lineColor = [UIColor whiteColor];
    self.segmentedBar.delegate = self;
    self.segmentedBar.dataSource = self;
    
    self.headerView = self.segmentedBar;
    self.pageView.dataSource = self;
    self.pageView.delegate = self;
    self.pageView.scrollPagingEnabled = YES;
    
    self.pageView.currentIndex = 0;
    
    [self.pageView reloadData];
    [self.segmentedBar reloadData];
}


#pragma mark - KMPagerView datasource

- (NSInteger)countInPagerView:(KMPageView *)pageView
{
    return 3;
}

- (UIViewController*)pageView:(KMPageView*)pageView viewControllerForPageAtIndex:(NSInteger)index
{
    switch (index) {
        case 0:
            if (self.table1 == nil)
            {
                self.table1 = [self.storyboard instantiateViewControllerWithIdentifier:@"Table1"];
                self.table1.title = @"Table1";
            }
            return self.table1;
            break;
        case 1:
            if (self.table2 == nil)
            {
                self.table2 = [self.storyboard instantiateViewControllerWithIdentifier:@"Table2"];
                self.table2.title = @"Table2";
            }
            return self.table2;
            break;
        case 2:
            if (self.table3 == nil)
            {
                self.table3 = [self.storyboard instantiateViewControllerWithIdentifier:@"Table3"];
                self.table3.title = @"Table3";
            }
            return self.table3;
            break;
    }
    return nil;
}

#pragma mark - ScrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if ([scrollView isKindOfClass:[KMPageView class]])
    {
        [self.segmentedBar scrollDidContentOffset:scrollView.contentOffset];
    }
}

#pragma mark - KMPagerView delegate

- (void)pageViewCurrentIndexDidChange:(KMPageView *)pagerView
{

}

#pragma mark - KMSegmentedView delegate

- (void)segmentedBar:(KMSegmentedBar *)segmentedBar didSelectIndex:(NSInteger)index
{
    [self.pageView setCurrentIndex:index animated:YES];
}

#pragma mark - KMSegmentedView dataSource

- (NSArray*)titlesInSegmentedBar:(KMSegmentedBar *)segmentedBar
{
    return @[
             @"first",@"second",@"third"
             ];
}



@end