////
////  UIView+Common.m
////  Coding_iOS
////
////  Created by 王 原闯 on 14-8-6.
////  Copyright (c) 2014年 Coding. All rights reserved.
////
//
//#import "UIView+Common.h"
//#define kTagBadgeView  1000
//#define kTagBadgePointView  1001
//#define kTagLineView 1007
//#import  "UIColor+expanded.h"
//
//@implementation UIView (Common)
//
//static char LoadingViewKey, BlankPageViewKey;
//
//- (void)setY:(CGFloat)y{
//    CGRect frame = self.frame;
//    frame.origin.y = y;
//    self.frame = frame;
//}
//- (void)setX:(CGFloat)x{
//    CGRect frame = self.frame;
//    frame.origin.x = x;
//    self.frame = frame;
//}
//- (void)setOrigin:(CGPoint)origin{
//    CGRect frame = self.frame;
//    frame.origin = origin;
//    self.frame = frame;
//}
//- (void)setHeight:(CGFloat)height{
//    CGRect frame = self.frame;
//    frame.size.height = height;
//    self.frame = frame;
//}
//- (void)setWidth:(CGFloat)width{
//    CGRect frame = self.frame;
//    frame.size.width = width;
//    self.frame = frame;
//}
//- (void)setSize:(CGSize)size{
//    CGRect frame = self.frame;
//    frame.size.width = size.width;
//    frame.size.height = size.height;
//    self.frame = frame;
//}
//
//- (CGFloat)maxXOfFrame{
//    return CGRectGetMaxX(self.frame);
//}
//
//- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown{
//    [self addLineUp:hasUp andDown:hasDown andColor:[UIColor colorWithHexString:@"0xc8c7cc"]];
//}
//
//- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color{
//    [self removeViewWithTag:kTagLineView];
//    if (hasUp) {
//        UIView *upView = [UIView lineViewWithPointYY:0 andColor:color];
//        upView.tag = kTagLineView;
//        [self addSubview:upView];
//    }
//    if (hasDown) {
//        UIView *downView = [UIView lineViewWithPointYY:CGRectGetMaxY(self.bounds)-0.5 andColor:color];
//        downView.tag = kTagLineView;
//        [self addSubview:downView];
//    }
//    return [self addLineUp:hasUp andDown:hasDown andColor:color andLeftSpace:0];
//}
//- (void)addLineUp:(BOOL)hasUp andDown:(BOOL)hasDown andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace{
//    [self removeViewWithTag:kTagLineView];
//    if (hasUp) {
//        UIView *upView = [UIView lineViewWithPointYY:0 andColor:color andLeftSpace:leftSpace];
//        upView.tag = kTagLineView;
//        [self addSubview:upView];
//    }
//    if (hasDown) {
//        UIView *downView = [UIView lineViewWithPointYY:CGRectGetMaxY(self.bounds)-0.5 andColor:color andLeftSpace:leftSpace];
//        downView.tag = kTagLineView;
//        [self addSubview:downView];
//    }
//}
//
//- (void)removeViewWithTag:(NSInteger)tag{
//    for (UIView *aView in [self subviews]) {
//        if (aView.tag == tag) {
//            [aView removeFromSuperview];
//        }
//    }
//}
//
//- (void)addRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii{
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
//    CAShapeLayer *maskLayer = [CAShapeLayer new];
//    maskLayer.frame = self.bounds;
//    maskLayer.path = maskPath.CGPath;
//    self.layer.mask = maskLayer;
//}
//
//- (CGSize)doubleSizeOfFrame{
//    CGSize size = self.frame.size;
//    return CGSizeMake(size.width*2, size.height*2);
//}
//
//- (UIViewController*)viewController
//{
//    for (UIView* next = [self superview]; next; next = next.superview)
//    {
//        UIResponder* nextResponder = [next nextResponder];
//        
//        if ([nextResponder isKindOfClass:[UIViewController class]])
//        {
//            return (UIViewController*)nextResponder;
//        }
//    }
//    return nil;
//}
//
//+ (CGRect)frameWithOutNav{
//    CGRect frame = kScreen_Bounds;
//    frame.size.height -= (20+44);//减去状态栏、导航栏的高度
//    return frame;
//}
//
//+ (UIViewAnimationOptions)animationOptionsForCurve:(UIViewAnimationCurve)curve
//{
//    switch (curve) {
//        case UIViewAnimationCurveEaseInOut:
//            return UIViewAnimationOptionCurveEaseInOut;
//            break;
//        case UIViewAnimationCurveEaseIn:
//            return UIViewAnimationOptionCurveEaseIn;
//            break;
//        case UIViewAnimationCurveEaseOut:
//            return UIViewAnimationOptionCurveEaseOut;
//            break;
//        case UIViewAnimationCurveLinear:
//            return UIViewAnimationOptionCurveLinear;
//            break;
//    }
//    
//    return kNilOptions;
//}
//
//+ (UIView *)lineViewWithPointYY:(CGFloat)pointY{
//    return [self lineViewWithPointYY:pointY andColor:[UIColor colorWithHexString:@"0xc8c7cc"]];
//}
//
//+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color{
//    return [self lineViewWithPointYY:pointY andColor:color andLeftSpace:0];
//}
//
//+ (UIView *)lineViewWithPointYY:(CGFloat)pointY andColor:(UIColor *)color andLeftSpace:(CGFloat)leftSpace{
//    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(leftSpace, pointY, kScreen_Width - leftSpace, 0.5)];
//    lineView.backgroundColor = color;
//    return lineView;
//}
//
//#pragma mark LoadingView
////- (void)setLoadingView:(EaseLoadingView *)loadingView{
////    [self willChangeValueForKey:@"LoadingViewKey"];
////    objc_setAssociatedObject(self, &LoadingViewKey, loadingView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//////    objc_setAssociatedObject(self, &LoadingViewKey,
//////                             loadingView,
//////                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
////    [self didChangeValueForKey:@"LoadingViewKey"];
////}
//- (EaseLoadingView *)loadingView{
//    return objc_getAssociatedObject(self, &LoadingViewKey);
//}
//
////- (void)beginLoading{
////    for (UIView *aView in [self.blankPageContainer subviews]) {
////        if ([aView isKindOfClass:[EaseBlankPageView class]] && !aView.hidden) {
////            return;
////        }
////    }
////    
////    if (!self.loadingView) { //初始化LoadingView
////        self.loadingView = [[EaseLoadingView alloc] initWithFrame:self.bounds];
////    }
////    [self addSubview:self.loadingView];
////    [self.loadingView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.self.edges.equalTo(self);
////    }];
////    [self.loadingView startAnimating];
////}
//
//- (void)endLoading{
//    if (self.loadingView) {
//        [self.loadingView stopAnimating];
//    }
//}
////
////#pragma mark BlankPageView
////- (void)setBlankPageView:(EaseBlankPageView *)blankPageView{
////    [self willChangeValueForKey:@"BlankPageViewKey"];
////    objc_setAssociatedObject(self, &BlankPageViewKey,
////                             blankPageView,
////                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
////    [self didChangeValueForKey:@"BlankPageViewKey"];
////}
//
//- (EaseBlankPageView *)blankPageView{
//    return objc_getAssociatedObject(self, &BlankPageViewKey);
//}
////🙋  🙋
//- (void)configBlankPage:(MHBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
//    if (hasData) {
//        if (self.blankPageView) {
//            self.blankPageView.hidden = YES;
//            [self.blankPageView removeFromSuperview];
//        }
//    }else{
//        if (!self.blankPageView) {
//            self.blankPageView = [[EaseBlankPageView alloc] initWithFrame:self.bounds];
//            NSLog(@"%f    %f",self.bounds.size.width,self.bounds.size.height);
//        }
//        self.blankPageView.hidden = NO;
//        [self.blankPageContainer addSubview:self.blankPageView];
//        
//        //        [self.blankPageContainer insertSubview:self.blankPageView atIndex:0];
//        //        [self.blankPageView mas_makeConstraints:^(MASConstraintMaker *make) {
//        //            make.size.equalTo(self);
//        //            make.top.left.equalTo(self.blankPageContainer);
//        //        }];
//        [self.blankPageView configWithType:blankPageType hasData:hasData hasError:hasError reloadButtonBlock:block];
//    }
//}
//
//- (UIView *)blankPageContainer{
//    UIView *blankPageContainer = self;
//    for (UIView *aView in [self subviews]) {
//        if ([aView isKindOfClass:[UITableView class]]) {
//            blankPageContainer = aView;
//        }
//    }
//    return blankPageContainer;
//}
//
//@end
//
//@interface EaseLoadingView ()
//@property (nonatomic, assign) CGFloat loopAngle, monkeyAlpha, angleStep, alphaStep;
//@end
//
//@implementation EaseLoadingView
//
//- (instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.backgroundColor = [UIColor clearColor];
//        _loopView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_loop"]];
//        _monkeyView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_tiger"]];
//        [_loopView setCenter:self.center];
//        [_monkeyView setCenter:self.center];
//        [self addSubview:_loopView];
//        [self addSubview:_monkeyView];
////        [_loopView mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.center.equalTo(self);
////        }];
////        [_monkeyView mas_makeConstraints:^(MASConstraintMaker *make) {
////            make.center.equalTo(self);
////        }];
//        
//        _loopAngle = 0.0;
//        _monkeyAlpha = 1.0;
//        _angleStep = 360/3;
//        _alphaStep = 1.0/3.0;
//    }
//    return self;
//}
//
//- (void)startAnimating{
//    self.hidden = NO;
//    if (_isLoading) {
//        return;
//    }
//    _isLoading = YES;
//    [self loadingAnimation];
//}
//
//- (void)stopAnimating{
//    self.hidden = YES;
//    _isLoading = NO;
//}
//
//- (void)loadingAnimation{
//    static CGFloat duration = 0.25f;
//    _loopAngle += _angleStep;
//    if (_monkeyAlpha >= 1.0 || _monkeyAlpha <= 0.0) {
//        _alphaStep = -_alphaStep;
//    }
//    _monkeyAlpha += _alphaStep;
//    [UIView animateWithDuration:duration delay:0.0 options:UIViewAnimationOptionCurveLinear animations:^{
//        CGAffineTransform loopAngleTransform = CGAffineTransformMakeRotation(_loopAngle * (M_PI / 180.0f));
//        _loopView.transform = loopAngleTransform;
//        _monkeyView.alpha = _monkeyAlpha;
//    } completion:^(BOOL finished) {
//        if (_isLoading && [self superview] != nil) {
//            [self loadingAnimation];
//        }else{
//            [self removeFromSuperview];
//            
//            _loopAngle = 0.0;
//            _monkeyAlpha = 1,0;
//            _alphaStep = ABS(_alphaStep);
//            CGAffineTransform loopAngleTransform = CGAffineTransformMakeRotation(_loopAngle * (M_PI / 180.0f));
//            _loopView.transform = loopAngleTransform;
//            _monkeyView.alpha = _monkeyAlpha;
//        }
//    }];
//}
//
//@end
//
//@implementation EaseBlankPageView
//- (instancetype)initWithFrame:(CGRect)frame{
//    self = [super initWithFrame:frame];
//    if (self) {
//        self.backgroundColor =kBGColor; //[UIColor clearColor];
//    }
//    return self;
//}
//
//- (void)configWithType:(MHBlankPageType)blankPageType hasData:(BOOL)hasData hasError:(BOOL)hasError reloadButtonBlock:(void (^)(id))block{
//    
//    if (hasData) {
//        [self removeFromSuperview];
//        return;
//    }
//    self.alpha = 1.0;
//    //    图片
//    if (!_monkeyView) {
//        _monkeyView = [[UIImageView alloc] initWithFrame:CGRectZero];
//        [self addSubview:_monkeyView];
//    }
//    //    文字
//    if (!_tipLabel) {
//        _tipLabel = [[UILabel alloc] initWithFrame:CGRectZero];
//        _tipLabel.backgroundColor = [UIColor clearColor];
//        _tipLabel.numberOfLines = 0;
//        _tipLabel.font = [UIFont systemFontOfSize:15];
//        _tipLabel.textColor = [UIColor lightGrayColor];
//        _tipLabel.textAlignment = NSTextAlignmentCenter;
//        [self addSubview:_tipLabel];
//    }
//    
//    //    布局
////    [_monkeyView mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.centerX.equalTo(self);
////        make.bottom.equalTo(self.mas_centerY);
////    }];
////    [_tipLabel mas_makeConstraints:^(MASConstraintMaker *make) {
////        make.left.right.centerX.equalTo(self);
////        make.top.equalTo(_monkeyView.mas_bottom);
////        make.height.mas_equalTo(50);
////    }];
//    
////    _reloadButtonBlock = nil;
////    if (hasError) {
////        //        加载失败
////        if (!_reloadButton) {
////            _reloadButton = [[UIButton alloc] initWithFrame:CGRectZero];
////            [_reloadButton setImage:[UIImage imageNamed:@"blankpage_button_reload"] forState:UIControlStateNormal];
////            _reloadButton.adjustsImageWhenHighlighted = YES;
////            [_reloadButton addTarget:self action:@selector(reloadButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
////            [self addSubview:_reloadButton];
////            [_reloadButton mas_makeConstraints:^(MASConstraintMaker *make) {
////                make.centerX.equalTo(self);
////                make.top.equalTo(_tipLabel.mas_bottom);
////                make.size.mas_equalTo(CGSizeMake(160, 60));
////            }];
////        }
////        _reloadButton.hidden = NO;
////        _reloadButtonBlock = block;
////        [_monkeyView setImage:[UIImage imageNamed:@"defaultNoMessage"]];
////        _tipLabel.text = @"貌似出了点差错\n真忧伤呢";
////    }else{
////        //        空白数据
////        if (_reloadButton) {
////            _reloadButton.hidden = YES;
////        }
////        NSString *imageName, *tipStr;
////        switch (blankPageType) {
////            case MHBlankPageTypeHeadline://头条
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"不会吧\n怎么可能没有头条信息呢";
////            }
////                break;
////            case MHBlankPageTypeCircle://圈子列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"竟然木有帖子，快点抢个一血吧~";
////            }
////                break;
////            case MHBlankPageTypeActivitySelect://活动精选列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"没有精选啊\n快点发布一个活动让它成为精选吧";
////            }
////                break;
////            case MHBlankPageTypeActivityAll://发现活动列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"来，发布一个活动～";
////            }
////                break;
////            case MHBlankPageTypeMessageReply://消息评论我列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"您还没有被评论过呢～";
////            }
////                break;
////            case MHBlankPageTypeMessagePraise://消息赞我列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"您还木有被赞过呢～";
////            }
////                break;
////            case MHBlankPageTypeMessageSystem://消息系统消息列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"哎呀，没有系统消息哦~";
////            }
////                break;
////            case MHBlankPageTypeDiscoveryHouse://找房子
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"";
////            }
////                break;
////            case MHBlankPageTypeDiscoveryWork://找工作
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"";
////            }
////                break;
////            case MHBlankPageTypeMyPost://我的帖子
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"木有我的帖子，快去发个帖子吧～";
////            }
////                break;
////            case MHBlankPageTypeMyActivityApply://我报名的活动
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"木有报名活动，快去嗨起来～";
////            }
////                break;
////            case MHBlankPageTypeMyActivitySend://我发布的活动
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"这个人很懒，一个活动都木有发布～";
////            }
////                break;
////            case MHBlankPageTypeMyCollectionActivity://我收藏的活动
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"这个人很懒，一个活动都木有收藏～";
////            }
////                break;
////            case MHBlankPageTypeMyCollectionCircle://我收藏的圈子
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"这个人很懒，一个帖子都木有收藏～";
////            }
////                break;
////            case MHBlankPageTypeApply://发布活动的报名列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"这个活动说不定很好\n快去报名吧~";
////            }
////                break;
////            case MHBlankPageTypePraise://发布活动的点赞列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"都来了，给他点个赞～";
////            }
////                break;
////            case MHBlankPageTypeGroup://发布活动的点赞列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"都来了，给他点个赞～";
////            }
//////                break;
//////            case MHBlankPageTypeNoMyActivity://发布活动的点赞列表
//////            {
//////                imageName = @"defaultNoMessage";
////                tipStr = @"该资源已被删除";
////            }
////                break;
////            case MHBlankPageTypeNoMyNews://发布活动的点赞列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"该资源已被删除";
////            }
////                break;
////            case MHBlankPageTypeNoMyPost://发布活动的点赞列表
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"该资源已被删除";
////            }
////                break;
////            default://其它页面（这里没有提到的页面，都属于其它）
////            {
////                imageName = @"defaultNoMessage";
////                tipStr = @"这里还什么都没有\n赶快起来弄出一点动静吧";
////            }
////                break;
////        }
////        [_monkeyView setImage:[UIImage imageNamed:imageName]];
////        _tipLabel.text = tipStr;
//////    }
//////}
////
////- (void)reloadButtonClicked:(id)sender{
////    self.hidden = YES;
////    [self removeFromSuperview];
////    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
////        if (_reloadButtonBlock) {
////            _reloadButtonBlock(sender);
////        }
////    });
////}
//
//@end
//
//
//
//
//
//
//
//
//
//
