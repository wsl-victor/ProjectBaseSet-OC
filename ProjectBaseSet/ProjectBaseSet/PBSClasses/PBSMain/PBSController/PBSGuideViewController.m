//
//  PBSGuideViewController.m
//  ProjectBaseSet
//
//  Created by victor on 16/8/30.
//  Copyright © 2016年 wsl. All rights reserved.
//

#import "PBSGuideViewController.h"
#import "PBSMainTabBarController.h"


#define k_Base_Tag  10000
#define k_Rotate_Rate 1
#define K_SCREEN_WIDHT [UIScreen mainScreen].bounds.size.width  //屏幕宽度
#define K_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height    //屏幕高
@interface PBSGuideViewController ()<UIScrollViewDelegate>

@end

@implementation PBSGuideViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor colorWithRed:140.0/255 green:1 blue:1 alpha:1];
    NSArray *imageArr = @[@"page_bg_35.png",@"page_bg_35.png",@"page_bg_35.png",@"page_bg_35.png"];
    NSArray *textImageArr = @[@"page_top_0.png",@"page_top_1.png",@"page_top_2.png",@"page_top_3.png"];
    
    UIScrollView *mainScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDHT, K_SCREEN_HEIGHT)];
    mainScrollView.pagingEnabled = YES;
    mainScrollView.bounces = YES;
    mainScrollView.contentSize = CGSizeMake(K_SCREEN_WIDHT*imageArr.count, K_SCREEN_HEIGHT);
    mainScrollView.showsHorizontalScrollIndicator = NO;
    mainScrollView.delegate = self;
    [self.view addSubview:mainScrollView];
    
    //添加云彩图片
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 330, K_SCREEN_WIDHT, 170*K_SCREEN_WIDHT/1242.0)];
    imageView.image = [UIImage imageNamed:@"guider_pai_35.png"];
    [self.view addSubview:imageView];
    
    
    for (int i=0; i<imageArr.count; i++) {
        UIView *rotateView = [[UIView alloc]initWithFrame:CGRectMake(K_SCREEN_WIDHT*i, 0, K_SCREEN_WIDHT, K_SCREEN_HEIGHT*2)];
        [rotateView setTag:k_Base_Tag+i];
        [mainScrollView addSubview:rotateView];
        if (i!=0) {
            rotateView.alpha = 0;
        }
        
        UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, K_SCREEN_WIDHT, K_SCREEN_HEIGHT)];
        imageView.image = [UIImage imageNamed:imageArr[i]];
        [rotateView addSubview:imageView];
        
        UIImageView *textImageView = [[UIImageView alloc]initWithFrame:CGRectMake(K_SCREEN_WIDHT*i, 50, K_SCREEN_WIDHT, K_SCREEN_WIDHT *260.0/1242.0)];
        [textImageView setTag:k_Base_Tag*2+i];
        textImageView.image = [UIImage imageNamed:textImageArr[i]];
        [mainScrollView addSubview:textImageView];
        
        //最后页面添加按钮
        if (i == imageArr.count-1) {
            UIControl *control = [[UIControl alloc]initWithFrame:CGRectMake(0, K_SCREEN_HEIGHT-80, K_SCREEN_WIDHT, 50)];
            [control addTarget:self action:@selector(ClickToRemove) forControlEvents:UIControlEventTouchUpInside];
            [rotateView addSubview:control];
        }
    }
    
    UIView *firstView = [mainScrollView viewWithTag:k_Base_Tag];
    [mainScrollView bringSubviewToFront:firstView];
}


-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    UIView * view1 = [scrollView viewWithTag:k_Base_Tag];
    UIView * view2 = [scrollView viewWithTag:k_Base_Tag+1];
    UIView * view3 = [scrollView viewWithTag:k_Base_Tag+2];
    UIView * view4 = [scrollView viewWithTag:k_Base_Tag+3];
    
    UIImageView * imageView1 = (UIImageView *)[scrollView viewWithTag:k_Base_Tag*2];
    UIImageView * imageView2 = (UIImageView *)[scrollView viewWithTag:k_Base_Tag*2+1];
    UIImageView * imageView3 = (UIImageView *)[scrollView viewWithTag:k_Base_Tag*2+2];
    UIImageView * imageView4 = (UIImageView *)[scrollView viewWithTag:k_Base_Tag*2+3];
    
    CGFloat xOffset = scrollView.contentOffset.x;
    
    //根据偏移量旋转
    CGFloat rotateAngle = -1 * 1.0/K_SCREEN_WIDHT * xOffset * M_PI_2 * k_Rotate_Rate;
    view1.layer.transform = CATransform3DMakeRotation(rotateAngle, 0, 0, 1);
    view2.layer.transform = CATransform3DMakeRotation(M_PI_2*1+rotateAngle, 0, 0, 1);
    view3.layer.transform = CATransform3DMakeRotation(M_PI_2*2+rotateAngle, 0, 0, 1);
    view4.layer.transform = CATransform3DMakeRotation(M_PI_2*3+rotateAngle, 0, 0, 1);
    
    //根据偏移量位移（保证中心点始终都在屏幕下方中间）
    view1.center = CGPointMake(0.5 * K_SCREEN_WIDHT+xOffset, K_SCREEN_HEIGHT);
    view2.center = CGPointMake(0.5 * K_SCREEN_WIDHT+xOffset, K_SCREEN_HEIGHT);
    view3.center = CGPointMake(0.5 * K_SCREEN_WIDHT+xOffset, K_SCREEN_HEIGHT);
    view4.center = CGPointMake(0.5 * K_SCREEN_WIDHT+xOffset, K_SCREEN_HEIGHT);
    
    //当前哪个视图放在最上面
    if (xOffset<K_SCREEN_WIDHT*0.5) {
        [scrollView bringSubviewToFront:view1];
        
    }else if (xOffset>=K_SCREEN_WIDHT*0.5 && xOffset < K_SCREEN_WIDHT*1.5){
        [scrollView bringSubviewToFront:view2];
        
        
    }else if (xOffset >=K_SCREEN_WIDHT*1.5 && xOffset < K_SCREEN_WIDHT*2.5){
        [scrollView bringSubviewToFront:view3];
        
    }else if (xOffset >=K_SCREEN_WIDHT*2.5)
    {
        [scrollView bringSubviewToFront:view4];
        
    }
    
    //调节其透明度
    CGFloat xoffset_More = xOffset*1.5>K_SCREEN_WIDHT?K_SCREEN_WIDHT:xOffset*1.5;
    if (xOffset < K_SCREEN_WIDHT) {
        view1.alpha = (K_SCREEN_WIDHT - xoffset_More)/K_SCREEN_WIDHT;
        imageView1.alpha = (K_SCREEN_WIDHT - xOffset)/K_SCREEN_WIDHT;;
        
    }
    if (xOffset <= K_SCREEN_WIDHT) {
        view2.alpha = xoffset_More / K_SCREEN_WIDHT;
        imageView2.alpha = xOffset / K_SCREEN_WIDHT;
    }
    if (xOffset >K_SCREEN_WIDHT && xOffset <= K_SCREEN_WIDHT*2) {
        view2.alpha = (K_SCREEN_WIDHT*2 - xOffset)/K_SCREEN_WIDHT;
        view3.alpha = (xOffset - K_SCREEN_WIDHT)/ K_SCREEN_WIDHT;
        
        imageView2.alpha = (K_SCREEN_WIDHT*2 - xOffset)/K_SCREEN_WIDHT;
        imageView3.alpha = (xOffset - K_SCREEN_WIDHT)/ K_SCREEN_WIDHT;
    }
    if (xOffset >K_SCREEN_WIDHT*2 ) {
        view3.alpha = (K_SCREEN_WIDHT*3 - xOffset)/K_SCREEN_WIDHT;
        view4.alpha = (xOffset - K_SCREEN_WIDHT*2)/ K_SCREEN_WIDHT;
        
        imageView3.alpha = (K_SCREEN_WIDHT*3 - xOffset)/K_SCREEN_WIDHT;
        imageView4.alpha = (xOffset - K_SCREEN_WIDHT*2)/ K_SCREEN_WIDHT;
    }
    
    //调节背景色
    if (xOffset <K_SCREEN_WIDHT && xOffset>0) {
        self.view.backgroundColor = [UIColor colorWithRed:(140-40.0/K_SCREEN_WIDHT*xOffset)/255.0 green:(255-25.0/K_SCREEN_WIDHT*xOffset)/255.0 blue:(255-100.0/K_SCREEN_WIDHT*xOffset)/255.0 alpha:1];
        
    }else if (xOffset>=K_SCREEN_WIDHT &&xOffset<K_SCREEN_WIDHT*2){
        
        self.view.backgroundColor = [UIColor colorWithRed:(100+30.0/K_SCREEN_WIDHT*(xOffset-K_SCREEN_WIDHT))/255.0 green:(230-40.0/K_SCREEN_WIDHT*(xOffset-K_SCREEN_WIDHT))/255.0 blue:(155-5.0/320*(xOffset-K_SCREEN_WIDHT))/255.0 alpha:1];
        
    }else if (xOffset>=K_SCREEN_WIDHT*2 &&xOffset<K_SCREEN_WIDHT*3){
        
        self.view.backgroundColor = [UIColor colorWithRed:(130-50.0/K_SCREEN_WIDHT*(xOffset-K_SCREEN_WIDHT*2))/255.0 green:(190-40.0/K_SCREEN_WIDHT*(xOffset-K_SCREEN_WIDHT*2))/255.0 blue:(150+50.0/K_SCREEN_WIDHT*(xOffset-K_SCREEN_WIDHT*2))/255.0 alpha:1];
        
    }else if (xOffset>=K_SCREEN_WIDHT*3 &&xOffset<K_SCREEN_WIDHT*4){
        
        self.view.backgroundColor = [UIColor colorWithRed:(80-10.0/K_SCREEN_WIDHT*(xOffset-K_SCREEN_WIDHT*3))/255.0 green:(150-25.0/K_SCREEN_WIDHT*(xOffset-K_SCREEN_WIDHT*3))/255.0 blue:(200-90.0/K_SCREEN_WIDHT*(xOffset-K_SCREEN_WIDHT*3))/255.0 alpha:1];
    }
    
}

-(void)ClickToRemove
{
  
    [self.view removeFromSuperview];
    
}





- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//====================================================
//====================================================
//====================================================
#define PBSNewfeatureImageCount 4

@interface PBSNewfeatureViewController () <UIScrollViewDelegate>
@property (nonatomic, weak) UIPageControl *pageControl;
@end

@implementation PBSNewfeatureViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 1.添加UISrollView
    [self setupScrollView];
    
    // 2.添加pageControl
    [self setupPageControl];
}

/**
 *  添加UISrollView
 */
- (void)setupScrollView
{
    // 1.添加UISrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    scrollView.delegate = self;
    [self.view addSubview:scrollView];
    
    // 2.添加图片
    CGFloat imageW = scrollView.width;
    CGFloat imageH = scrollView.height;
    for (int i = 0; i<PBSNewfeatureImageCount; i++) {
        // 创建UIImageView
        UIImageView *imageView = [[UIImageView alloc] init];
        NSString *name = [NSString stringWithFormat:@"new_feature_%d", i + 1];
        imageView.image = [UIImage imageWithName:name];
        [scrollView addSubview:imageView];
        
        // 设置frame
        imageView.y = 0;
        imageView.width = imageW;
        imageView.height = imageH;
        imageView.x = i * imageW;
        
        // 给最后一个imageView添加按钮
        if (i == PBSNewfeatureImageCount - 1) {
            [self setupLastImageView:imageView];
        }
    }
    
    // 3.设置其他属性
    scrollView.contentSize = CGSizeMake(PBSNewfeatureImageCount * imageW, 0);
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.backgroundColor = PBSColorRGB(246, 246, 246);
// 别在scrollView.subviews中通过索引来查找对应的子控件
    //    [scrollView.subviews lastObject];
}

/**
 *  添加pageControl
 */
- (void)setupPageControl
{
    // 1.添加
    UIPageControl *pageControl = [[UIPageControl alloc] init];
    pageControl.numberOfPages = PBSNewfeatureImageCount;
    pageControl.centerX = self.view.width * 0.5;
    pageControl.centerY = self.view.height - 30;
    [self.view addSubview:pageControl];
    
    // 2.设置圆点的颜色
    pageControl.currentPageIndicatorTintColor = PBSColorRGB(253, 98, 42); // 当前页的小圆点颜色
    pageControl.pageIndicatorTintColor = PBSColorRGB(189, 189, 189); // 非当前页的小圆点颜色
    self.pageControl = pageControl;
}

/**
 设置最后一个UIImageView中的内容
 */
- (void)setupLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled = YES;
    
    // 1.添加开始按钮
    [self setupStartButton:imageView];
    
    // 2.添加分享按钮
    [self setupShareButton:imageView];
}

/**
 *  添加分享按钮
 */
- (void)setupShareButton:(UIImageView *)imageView
{
    // 1.添加分享按钮
    UIButton *shareButton = [[UIButton alloc] init];
    [imageView addSubview:shareButton];
    
    // 2.设置文字和图标
    [shareButton setTitle:@"立即进入" forState:UIControlStateNormal];
    [shareButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_false"] forState:UIControlStateNormal];
    [shareButton setImage:[UIImage imageWithName:@"new_feature_share_true"] forState:UIControlStateSelected];
    // 监听点击
    [shareButton addTarget:self action:@selector(share:) forControlEvents:UIControlEventTouchUpInside];
    
    // 3.设置frame
    shareButton.size = CGSizeMake(150, 35);
    shareButton.centerX = self.view.width * 0.5;
    shareButton.centerY = self.view.height * 0.7;
    
    // 4.设置间距
    // top left bottom right
    // 内边距 == 自切
    // 被切掉的区域就不能显示内容了
    // contentEdgeInsets : 切掉按钮内部的内容
    // imageEdgeInsets : 切掉按钮内部UIImageView的内容
    // titleEdgeInsets : 切掉按钮内部UILabel的内容
    shareButton.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
}

/**
 分享
 */
- (void)share:(UIButton *)shareButton
{
    shareButton.selected = !shareButton.isSelected;
}

/**
 *  添加开始按钮
 */
- (void)setupStartButton:(UIImageView *)imageView
{
    // 1.添加开始按钮
    UIButton *startButton = [[UIButton alloc] init];
    [imageView addSubview:startButton];
    
    // 2.设置背景图片
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button"] forState:UIControlStateNormal];
    [startButton setBackgroundImage:[UIImage imageWithName:@"new_feature_finish_button_highlighted"] forState:UIControlStateHighlighted];
    
    // 3.设置frame
    startButton.size = startButton.currentBackgroundImage.size;
    startButton.centerX = self.view.width * 0.5;
    startButton.centerY = self.view.height * 0.8;
    
    // 4.设置文字
    [startButton setTitle:@"立即进入" forState:UIControlStateNormal];
    [startButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [startButton addTarget:self action:@selector(start) forControlEvents:UIControlEventTouchUpInside];
}

/**
 *  开始微博
 */
- (void)start
{
    [UIApplication sharedApplication].statusBarHidden = NO;
    
    // 显示主控制器（HMTabBarController）
    PBSMainTabBarController *vc = [[PBSMainTabBarController alloc] init];
    
    // 切换控制器
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = vc;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 获得页码
    CGFloat doublePage = scrollView.contentOffset.x / scrollView.width;
    int intPage = (int)(doublePage + 0.5);
    
    // 设置页码
    self.pageControl.currentPage = intPage;
}

- (void)dealloc
{
  
}

@end


//====================================================
//====================================================

//====================================================
//====================================================


#define screenW self.view.frame.size.width
#define screenH self.view.frame.size.height
#define pageCount 5
#define picH 2330 / 2
#define padding 200
#define topPicH 70
#define topPicW 112
#define btnH 35
#define btnW 140
@interface PBSADo_ViewController ()<UIScrollViewDelegate>
/**
 *  底部滚动图片
 */
@property (nonatomic,strong)UIScrollView *guideView;
/**
 *  球形图片
 */
@property (nonatomic,strong)UIImageView *picView;
/**
 *  牌型滚动
 */
@property (nonatomic,strong)UIImageView *paiView;
/**
 *  指示
 */
@property (nonatomic,strong)UIPageControl *pageControl;
/**
 *  顶部图片滚动
 */
@property (nonatomic,strong)UIScrollView *topView;
@end

@implementation PBSADo_ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    /**
     背景图片
     */
    UIImageView *backView = [[UIImageView alloc]initWithFrame:self.view.frame];
    backView.image = [UIImage imageNamed:@"page_bg_35"];
    [self.view addSubview:backView];
    
    /**
     滚动 辅助作用
     */
    UIScrollView *ado_guideView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    ado_guideView.contentSize = CGSizeMake(screenW * pageCount, screenH);
    ado_guideView.bounces = NO;
    ado_guideView.pagingEnabled = YES;
    ado_guideView.delegate = self;
    ado_guideView.showsHorizontalScrollIndicator = NO;
    
    /**
     滚动球
     
     */
    UIImageView *picView = [[UIImageView alloc] init];
    picView.width = picH ;
    picView.height = picH;
    picView.centerX = screenW / 2;
    picView.centerY = screenH + padding;
//warning 设置锚点是个坑
    picView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    picView.image = [UIImage imageNamed:@"guider_qiu_35"];
    
    /**
     滚动牌
     */
    UIImageView *paiView = [[UIImageView alloc] init];
    paiView.width = picH;
    paiView.height = picH;
    paiView.centerX = screenW / 2 ;
    paiView.centerY = screenH + padding;
    paiView.layer.anchorPoint = CGPointMake(0.5, 0.5);
    paiView.image = [UIImage imageNamed:@"guider_pai_35"];
    
    /**
     指示器
     */
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(screenW / 2 - 50, screenH - 20, 100, 20)];
    pageControl.numberOfPages = 5;
    pageControl.currentPage = 0;
    pageControl.pageIndicatorTintColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.1];
    pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    [backView addSubview:pageControl];
    
    /**
     顶部滚动图片
     */
    UIScrollView *topView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, screenW, topPicH)];
    topView.contentSize = CGSizeMake(screenW * pageCount, topPicH);
    topView.bounces = NO;
    topView.pagingEnabled = YES;
    for (int i = 0; i < pageCount; i ++) {
        UIImageView *topPic =  [[UIImageView alloc] init];
        topPic.width = topPicW;
        topPic.height = topPicH;
        topPic.centerX = i * screenW + screenW / 2;
        topPic.y = 0;
        NSString *picName = [NSString stringWithFormat:@"page_top_%d",i];
        topPic.image = [UIImage imageNamed:picName];
        [topView addSubview:topPic];
    }
    [backView addSubview:topView];
    self.topView = topView;
    
    self.pageControl = pageControl;
    [self.view addSubview:paiView];
    [self.view addSubview:picView];
    [self.view addSubview:ado_guideView];
    self.guideView = ado_guideView;
    self.picView = picView;
    self.paiView = paiView;
    
}

/**
 *  模态到下个页面
 *
 */
- (void)go2MainVC:(UIButton *)btn
{
   
}

/**
 *  scrollView代理方法
 */
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    float offSetX = scrollView.contentOffset.x;
    self.picView.layer.transform = CATransform3DMakeRotation(-offSetX*(M_PI)/screenW / 3, 0, 0, 1);
    self.paiView.layer.transform = CATransform3DMakeRotation(-offSetX*(M_PI)/screenW / 3, 0, 0, 1);
    self.pageControl.currentPage = scrollView.contentOffset.x / screenW;
    
    
    if (self.pageControl.currentPage == 4) {
        UIButton *nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(screenW / 2  + offSetX - btnW / 2, screenH - 121, btnW, btnH)];
        [nextBtn addTarget:self action:@selector(go2MainVC:) forControlEvents:UIControlEventTouchUpInside];
        nextBtn.backgroundColor = [UIColor clearColor];
        [scrollView addSubview:nextBtn];
    }
    
    
    self.topView.contentOffset = CGPointMake(offSetX, 0);
}

@end



