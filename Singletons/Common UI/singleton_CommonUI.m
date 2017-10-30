//
//  singleton_CommonUIActions.m
//  Ussie
//
//  Created by ArshAulakh on 28/11/14.
//  Copyright (c) 2014 ArshAulakh. All rights reserved.
//

#import "singleton_CommonUI.h"

@implementation singleton_CommonUI

@synthesize windowRect,device;

#pragma mark -
#pragma mark -Initialization Methods

//+ (id)sharedInstance {
//    static singleton_CommonUI *sharedInstance = nil;
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        sharedInstance = [[self alloc] init];
//    });
//    return sharedInstance;
//}


+(id)sharedInstance{
    static singleton_CommonUI *shareInstance= nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        shareInstance = [[self alloc] init];
        
    });
    return  shareInstance;
}


- (id)init {
    if (self = [super init]) {
    }
    return self;
}

#pragma mark -
#pragma mark -Get Device Model Method

- (iDeviceType)getDeviceModel {
    windowRect = [[(AppDelegate *)[[UIApplication sharedApplication] delegate] window] frame];
    switch ((int)windowRect.size.height) {
        case 480:
            device=iPhone4;
            break;
        case 568:
            device=iPhone5;
            break;
        case 667:
            device=iPhone6;
            break;
        case 736:
            device=iPhone6Plus;
            break;
        default:
            NSLog(@"Unknown Device Model");
            break;
    }
    return device;
}

#pragma mark -
#pragma mark -Set UI Button For Navigation Bar
- (void)setNavigationBarImage:(UIImage *)image andTitle:(NSString *)title withColor:(UIColor *)color andVisibility:(BOOL)visible andTranslucency:(BOOL)translucent forTarget:(id)target {
    [target navigationController].navigationBarHidden = !visible;
    [target navigationController].navigationBar.translucent = translucent;
    [[target navigationController].navigationBar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
    [[target navigationController].navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:color,NSForegroundColorAttributeName,[UIColor whiteColor],NSBackgroundColorAttributeName,nil]];
    [target setTitle:title];
}

#pragma mark -
#pragma mark -Set Right Button For Navigation Bar

- (void)setCustomBackButtonForNavBarWithText:(NSString *)text OrImage:(UIImage *)img andSelector:(SEL)selector OfTarget:(id)target {
    UIButton *btn_mainMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_mainMenu setFrame:CGRectMake(0, 0, 44, 44)];
    if (img!=nil) {
        [btn_mainMenu setImage:img forState:UIControlStateNormal];
    } else {
        [btn_mainMenu setTitle:text forState:UIControlStateNormal];
    }
    //    [btn_mainMenu.titleLabel setFont:kAppFont_B14];
    [btn_mainMenu addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn_mainMenu];
    [target navigationItem].leftBarButtonItem = barButton1;
}

- (void)setLeftBtnForNavBarWithText:(NSString *)text OrImage:(UIImage *)img andSelector:(SEL)selector OfTarget:(id)target {
    UIButton *btn_mainMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_mainMenu setFrame:CGRectMake(0, 0, 44, 44)];
    if (img!=nil) {
        [btn_mainMenu setImage:img forState:UIControlStateNormal];
    } else {
        [btn_mainMenu setTitle:text forState:UIControlStateNormal];
    }
    //    [btn_mainMenu.titleLabel setFont:kAppFont_B14];
    [btn_mainMenu addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn_mainMenu];
    [target navigationItem].leftBarButtonItem = barButton1;
}

- (void)setLeftBtnForNavBarWithText:(NSString *)text OrImage:(UIImage *)img andBorder:(BOOL)border andSelector:(SEL)selector OfTarget:(id)target {
    UIButton *btn_mainMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_mainMenu setFrame:CGRectMake(0, 0, 44, 44)];
    if (img!=nil) {
        [btn_mainMenu setImage:img forState:UIControlStateNormal];
    } else {
        [btn_mainMenu setTitle:text forState:UIControlStateNormal];
    }
    //    [btn_mainMenu.titleLabel setFont:kAppFont_B14];
    [btn_mainMenu addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    if (border) {
        [self addRightBorder:btn_mainMenu];
    }
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn_mainMenu];
    [target navigationItem].leftBarButtonItem = barButton1;
}

- (void)setRightBtnForNavBarWithDefaultImage:(BOOL)flag_image OrImage:(UIImage *)img andSelector:(SEL)selector OfTarget:(id)target {
    if (flag_image) {
        img = [UIImage imageNamed:@"menu-icon.png"];
    }
    
    UIButton *btn_mainMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_mainMenu setImage:img forState:UIControlStateNormal];
    [btn_mainMenu setFrame:CGRectMake(0, 0, 44, 44)];
    [btn_mainMenu addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn_mainMenu];
    [target navigationItem].rightBarButtonItem = barButton1;
}

- (void)setRightBtnForNavBarWithDefaultImage:(BOOL)flag_image OrImage:(UIImage *)img andBorder:(BOOL)border andSelector:(SEL)selector OfTarget:(id)target {
    if (flag_image) {
        img = [UIImage imageNamed:@"menu-icon.png"];
    }
    UIButton *btn_mainMenu = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn_mainMenu setImage:img forState:UIControlStateNormal];
    [btn_mainMenu setFrame:CGRectMake(10, 0, 44, 44)];
    [btn_mainMenu addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    if (border) {
        [self addLeftBorder:btn_mainMenu];
    }
    UIBarButtonItem *barButton1 = [[UIBarButtonItem alloc] initWithCustomView:btn_mainMenu];
    [target navigationItem].rightBarButtonItem = barButton1;
}

- (void)setRightBtnForNavBarWithImage:(UIImage *)img andSelector:(SEL)selector OfTarget:(id)target {
    [[target navigationController].navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithImage:img style:UIBarButtonItemStylePlain target:target action:selector];
    [target navigationItem].rightBarButtonItem = btn;
}

- (void)setLeftBtnForNavBarWithImage:(UIImage *)img andSelector:(SEL)selector OfTarget:(id)target{
    [[target navigationController].navigationBar setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithImage:img style:UIBarButtonItemStylePlain target:target action:selector];
    [target navigationItem].leftBarButtonItem = btn;
}

-(void)setCornerrRadius:(UITextField *)Txt {
    Txt.layer.cornerRadius=10;
    Txt.layer.masksToBounds=YES;
}
-(void)edges:(UITextField *)Txt {
    Txt.layer.cornerRadius=5;
    Txt.layer.masksToBounds=YES;
}



#pragma mark -
#pragma mark -Add Left Views And Border Methods

- (void)addLeftViewToTextField: (UITextField *)txtFld withImage: (UIImage *)img {
    UIView *left_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, txtFld.frame.size.height, txtFld.frame.size.height)];
    [left_view setBackgroundColor:[UIColor clearColor]];
    UIImageView *left_imgView = [[UIImageView alloc]initWithFrame:CGRectMake(left_view.frame.size.width/2 - img.size.width/2, left_view.frame.size.height/2 - img.size.height/2, img.size.width, img.size.height)];
    [left_imgView setImage:img];
    [left_view addSubview:left_imgView];
    [self addRightBorder:left_view];
    txtFld.leftView = left_view;
    txtFld.leftViewMode = UITextFieldViewModeAlways;
}

- (void)addLeftViewToTextField: (UITextField *)txtFld withSpacerWidth:(CGFloat)width {
    UIView *left_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, width, txtFld.frame.size.height)];
    [left_view setBackgroundColor:[UIColor clearColor]];
    txtFld.leftView = left_view;
    txtFld.leftViewMode = UITextFieldViewModeAlways;
}



- (void)addRightViewToTextField: (UITextField *)txtFld withImage: (UIImage *)img {
    UIView *left_view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, txtFld.frame.size.height, txtFld.frame.size.height)];
    [left_view setBackgroundColor:[UIColor clearColor]];
    UIImageView *left_imgView = [[UIImageView alloc]initWithFrame:CGRectMake(left_view.frame.size.width/2 - img.size.width/2,left_view.frame.size.height/2 - img.size.height/2, img.size.width, img.size.height)];
    [left_imgView setImage:img];
    [left_view addSubview:left_imgView];
    [self addRightBorder:left_view];
    txtFld.rightView = left_view;
    txtFld.rightViewMode = UITextFieldViewModeAlways;
}

- (void)addLeftBorder: (UIView *)view {
    CALayer *leftBorder = [CALayer layer];
    leftBorder.frame = CGRectMake(0, 0.125f * view.frame.size.height, 1.0f, view.frame.size.height * 0.75f);
    leftBorder.backgroundColor = [UIColor darkGrayColor].CGColor;
    [view.layer addSublayer:leftBorder];
}

- (void)addRightBorder: (UIView *)view {
    CALayer *rightBorder = [CALayer layer];
    rightBorder.frame = CGRectMake(view.frame.size.width - 5, 0.125f * view.frame.size.height, 1.0f, view.frame.size.height * 0.75f);
    rightBorder.backgroundColor = [UIColor darkGrayColor].CGColor;
    [view.layer addSublayer:rightBorder];
}

#pragma mark -
#pragma mark -Edit Placeholders Method

- (void)setTextField:(UITextField *)textField placeholderColor:(UIColor *)color {
    
    textField.attributedPlaceholder = [[NSAttributedString alloc] initWithString:textField.placeholder attributes:@{NSForegroundColorAttributeName:color, NSFontAttributeName : textField.font }];
}
- (void)FetchAndChangeTextAndPlaceholderColorToDefaultOfAllTextFieldsInView:(UIView *)view {
    // Get the subviews of the view
    NSArray *subviews = [view subviews];
    for (UIView *subview in subviews) {
        // Do what you want to do with the subview
        if ([subview isKindOfClass:[UITextField class]]) {
            UITextField *txt = (UITextField *)subview;
            txt.textColor = [UIColor blackColor];
            txt.attributedPlaceholder = [[NSAttributedString alloc] initWithString:txt.placeholder attributes:@{NSForegroundColorAttributeName:[UIColor lightGrayColor], NSFontAttributeName : txt.font }];
        }
        // List the subviews of subview
        [self FetchAndResignAllTextFieldsInView:subview];
    }
}

#pragma mark -
#pragma mark -Handling Keyboard Actions
- (void)FetchAndResignAllTextFieldsInView:(UIView *)view {
    // Get the subviews of the view
    NSArray *subviews = [view subviews];
    for (UIView *subview in subviews) {
        // Do what you want to do with the subview
        if ([subview isKindOfClass:[UITextField class]]) {
            UITextField *txt = (UITextField *)subview;
            [txt resignFirstResponder];
        }
        // List the subviews of subview
        [self FetchAndResignAllTextFieldsInView:subview];
    }
}

- (void)setupKeyboardAvoidanceOnTarget:(id)target withSelectorForShow:(SEL)show andHide:(SEL)hide {
    // Listen for keyboard appearance
    [[NSNotificationCenter defaultCenter] addObserver:target selector:show name:UIKeyboardDidShowNotification object:nil];
    // Listen for keyboard disappearance
    [[NSNotificationCenter defaultCenter] addObserver:target selector:hide name:UIKeyboardWillHideNotification object:nil];
}

-(void)startKeyboardAvoidanceOnSelectedTextField:(UITextField *)selectedTextField WithNotification:(NSNotification *)notification OnTargetView:(UIView *)targetView {
    //Get Keyboard Info From Notification
    NSDictionary* info = [notification userInfo];
    //Get Minimum Y co-ordinates of Keyboard
    float keyboardMinYValue = CGRectGetMinY([[info objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue]);
    //Get Maximum Y co-ordinates of Selected Textfield
    float txtFldMaxYValue = CGRectGetMaxY([selectedTextField.superview convertRect:selectedTextField.frame toView:nil]);
    //Check If Overlapping, Then Scroll View Up
    if (keyboardMinYValue<txtFldMaxYValue) {
        [UIView beginAnimations:nil context:nil];
        [UIView setAnimationDuration:0.25f];
        targetView.transform = CGAffineTransformMakeTranslation(0, (keyboardMinYValue-txtFldMaxYValue));
        [UIView commitAnimations];
    }
}

- (void)finishKeyboardAvoidanceOnTargetView:(UIView *)targetView {
    //Scroll View Down If Previously Scrolled Up
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.25f];
    targetView.transform = CGAffineTransformIdentity;
    [UIView commitAnimations];
}





@end
