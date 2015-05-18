//
//  ViewController.m
//  TestWangyi
//
//  Created by jjx on 15/5/18.
//  Copyright (c) 2015年 jjx. All rights reserved.
//

#import "ViewController.h"
#import "ViewController1.h"
#import "ViewController2.h"
#import "ViewController3.h"
#import "ViewController4.h"
#import "ViewController5.h"
#import "ViewController6.h"
#import "ViewController7.h"
#import "ViewController8.h"

@interface ViewController ()

@end

@implementation ViewController {
  UIScrollView* m_scrollView;
  UIScrollView* m_topScrollView;
}

- (void)viewDidLoad {
  [super viewDidLoad];

  if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0) {
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.automaticallyAdjustsScrollViewInsets = NO;
  }

  // self.view.backgroundColor = [UIColor clearColor];

  m_topScrollView = [[UIScrollView alloc]
      initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 44)];
  m_topScrollView.backgroundColor = [UIColor clearColor];
  m_topScrollView.showsHorizontalScrollIndicator = NO;
  m_topScrollView.showsVerticalScrollIndicator = NO;

  [self.view addSubview:m_topScrollView];

  NSMutableArray* array = [[NSMutableArray alloc] initWithCapacity:2];
  [array addObject:@"头条"];
  [array addObject:@"娱乐"];
  [array addObject:@"热点"];
  [array addObject:@"科技"];
  [array addObject:@"段子"];
  [array addObject:@"图片"];
  [array addObject:@"房产"];
  [array addObject:@"游戏"];

  for (int i = 0; i < 8; i++) {
    UIButton* button =
        [[UIButton alloc] initWithFrame:CGRectMake(60 * i + i * 5, 0, 60, 44)];
    //[button setText:[array objectAtIndex:i]];
    [button setTitle:[array objectAtIndex:i] forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    button.tag = i;

    [button addTarget:self
                  action:@selector(pageSelectd:)
        forControlEvents:UIControlEventTouchDown];

    [m_topScrollView addSubview:button];
  }

  m_topScrollView.contentSize = CGSizeMake(60 * 8 + 5 * 8, 44);

  m_scrollView = [[UIScrollView alloc]
      initWithFrame:CGRectMake(0, 44, self.view.bounds.size.width,
                               self.view.bounds.size.height - 44)];
  m_scrollView.backgroundColor = [UIColor clearColor];
  m_scrollView.showsHorizontalScrollIndicator = NO;
  m_scrollView.showsVerticalScrollIndicator = NO;
  m_scrollView.delegate = self;
  m_scrollView.pagingEnabled = YES;

  [self.view addSubview:m_scrollView];

  UIStoryboard* storyboard =
      [UIStoryboard storyboardWithName:@"Main" bundle:nil];

  ViewController1* viewController1 =
      [storyboard instantiateViewControllerWithIdentifier:@"view1"];

  ViewController2* viewController2 =
      [storyboard instantiateViewControllerWithIdentifier:@"view2"];

  ViewController3* viewController3 =
      [storyboard instantiateViewControllerWithIdentifier:@"view3"];

  ViewController4* viewController4 =
      [storyboard instantiateViewControllerWithIdentifier:@"view4"];

  ViewController5* viewController5 =
      [storyboard instantiateViewControllerWithIdentifier:@"view5"];

  ViewController6* viewController6 =
      [storyboard instantiateViewControllerWithIdentifier:@"view6"];

  ViewController7* viewController7 =
      [storyboard instantiateViewControllerWithIdentifier:@"view7"];

  ViewController8* viewController8 =
      [storyboard instantiateViewControllerWithIdentifier:@"view8"];

  UIView* view1 = viewController1.view;
  view1.frame = CGRectMake(0, 0, self.view.bounds.size.width,
                           self.view.bounds.size.height - 44);

  UIView* view2 = viewController2.view;
  view2.frame =
      CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width,
                 self.view.bounds.size.height - 44);

  UIView* view3 = viewController3.view;
  view3.frame = CGRectMake(self.view.bounds.size.width * 2, 0,
                           self.view.bounds.size.width,
                           self.view.bounds.size.height - 44);

  UIView* view4 = viewController4.view;
  view4.frame = CGRectMake(self.view.bounds.size.width * 3, 0,
                           self.view.bounds.size.width,
                           self.view.bounds.size.height - 44);

  UIView* view5 = viewController5.view;
  view5.frame = CGRectMake(self.view.bounds.size.width * 4, 0,
                           self.view.bounds.size.width,
                           self.view.bounds.size.height - 44);

  UIView* view6 = viewController6.view;
  view6.frame = CGRectMake(self.view.bounds.size.width * 5, 0,
                           self.view.bounds.size.width,
                           self.view.bounds.size.height - 44);

  UIView* view7 = viewController7.view;
  view7.frame = CGRectMake(self.view.bounds.size.width * 6, 0,
                           self.view.bounds.size.width,
                           self.view.bounds.size.height - 44);

  UIView* view8 = viewController8.view;
  view8.frame = CGRectMake(self.view.bounds.size.width * 7, 0,
                           self.view.bounds.size.width,
                           self.view.bounds.size.height - 44);

  m_scrollView.contentSize = CGSizeMake(self.view.bounds.size.width * 8, 0);

  [m_scrollView addSubview:view1];
  [m_scrollView addSubview:view2];
  [m_scrollView addSubview:view3];
  [m_scrollView addSubview:view4];
  [m_scrollView addSubview:view5];
  [m_scrollView addSubview:view6];
  [m_scrollView addSubview:view7];
  [m_scrollView addSubview:view8];
}

- (void)pageSelectd:(id)sender {
  UIButton* button = (UIButton*)sender;
  int tag = button.tag;

  CGPoint point = CGPointMake(self.view.bounds.size.width * tag, 0);
  // [m_scrollView setContentOffset:point];
  [m_scrollView setContentOffset:point animated:YES];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView*)scrollView {
  NSLog(@"%d", (int)scrollView.bounds.origin.x);
}

@end
