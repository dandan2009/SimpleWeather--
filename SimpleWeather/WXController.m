//
//  WXController.m
//  SimpleWeather
//
//  Created by xinxiyuan on 14-6-14.
//  Copyright (c) 2014年 com.shan. All rights reserved.
//

#import "WXController.h"
#import <LBBlurredImage/UIImageView+LBBlurredImage.h>

@interface WXController ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UIImageView *blurredImageView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, assign) CGFloat screenHeight;

@end

@implementation WXController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    self.screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    UIImage *background = [UIImage imageNamed:@"bg"];
    
    self.backgroundImageView = [[UIImageView alloc] initWithImage:background];
    self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
    [self.view addSubview:self.backgroundImageView];
    
    
    self.blurredImageView = [[UIImageView alloc] init];
    self.blurredImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.blurredImageView.alpha = 0.0;
    [self.blurredImageView setImageToBlur:background blurRadius:10 completionBlock:nil];
    
    [self.view addSubview:self.blurredImageView];
    
    
    self.tableView = [[UITableView alloc] init];
    self.tableView.backgroundColor = [UIColor clearColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.separatorColor = [UIColor colorWithWhite:1 alpha:0.2];
    //?
    self.tableView.pagingEnabled = YES;
    [self.view addSubview:self.tableView];
    
    
    // 1
    CGRect headerFrame = [UIScreen mainScreen].bounds;
    // 2
    CGFloat inset = 20;
    // 3
    CGFloat temperatureHeight = 110;
    CGFloat hiloHeight = 40;
    CGFloat iconHeight = 30;
    // 4
    CGRect hiloFrame = CGRectMake(inset,headerFrame.size.height - hiloHeight,headerFrame.size.width - (2 * inset),hiloHeight);
    
    CGRect temperatureFrame = CGRectMake(inset,headerFrame.size.height - (temperatureHeight + hiloHeight),headerFrame.size.width - (2 * inset),temperatureHeight);
    
    CGRect iconFrame = CGRectMake(inset,temperatureFrame.origin.y - iconHeight,iconHeight,iconHeight);
    
    // 5
    CGRect conditionsFrame = iconFrame;
    conditionsFrame.size.width = self.view.bounds.size.width - (((2 * inset) + iconHeight) + 10);
    conditionsFrame.origin.x = iconFrame.origin.x + (iconHeight + 10);

}



//这是iOS7的新方法，改变状态栏的颜色
- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UITableViewDataSource

// 2
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
   // TODO: Return count of forecast
    return 0;
    
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     static NSString *CellIdentifier = @"CellIdentifier";
    
      UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
       if (! cell)
       {
        
              cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
      // 3
      //设置单元格显示风格
      cell.selectionStyle = UITableViewCellSelectionStyleNone;
      //
      cell.backgroundColor = [UIColor colorWithWhite:0 alpha:0.2];
    //whiteColor
      cell.textLabel.textColor = [UIColor blackColor];
    //whiteColor
      cell.detailTextLabel.textColor = [UIColor redColor];
    
    
    // TODO: Setup the cell
    return cell;
    
}



#pragma mark - UITableViewDelegate



- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // TODO: Determine cell height based on screen
    
    return 44;
}

- (void)viewWillLayoutSubviews
{
    
    [super viewWillLayoutSubviews];
    CGRect bounds = self.view.bounds;
    self.backgroundImageView.frame = bounds;
    self.blurredImageView.frame = bounds;
    self.tableView.frame = bounds;
    
}

@end
