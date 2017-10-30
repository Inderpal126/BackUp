//
//  singleton_CommonUIActions.h
//  Ussie
//
//  Created by ArshAulakh on 28/11/14.
//  Copyright (c) 2014 ArshAulakh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <sys/utsname.h>
#import <CoreLocation/CoreLocation.h>

typedef enum playerStateTypes {
    iPhone4,
    iPhone5,
    iPhone6,
    iPhone6Plus
} iDeviceType;

@interface singleton_CommonUI : UIViewController <CLLocationManagerDelegate>

@property iDeviceType device;
@property CGRect windowRect;
+ (id)sharedInstance;

#pragma mark Get Device Model Method
- (iDeviceType)getDeviceModel;

#pragma mark -Set UI Button For Navigation Bar
- (void)setNavigationBarImage:(UIImage *)image andTitle:(NSString *)title withColor:(UIColor *)color andVisibility:(BOOL)visible andTranslucency:(BOOL)translucent forTarget:(id)target ;

#pragma mark -Set Right Button For Navigation Bar
- (void)setCustomBackButtonForNavBarWithText:(NSString *)text OrImage:(UIImage *)img andSelector:(SEL)selector OfTarget:(id)target;
- (void)setLeftBtnForNavBarWithText:(NSString *)text OrImage:(UIImage *)img andSelector:(SEL)selector OfTarget:(id)target;
- (void)setLeftBtnForNavBarWithText:(NSString *)text OrImage:(UIImage *)img andBorder:(BOOL)border andSelector:(SEL)selector OfTarget:(id)target;
- (void)setRightBtnForNavBarWithDefaultImage:(BOOL)flag_image OrImage:(UIImage *)img andSelector:(SEL)selector OfTarget:(id)target;
- (void)setRightBtnForNavBarWithDefaultImage:(BOOL)flag_image OrImage:(UIImage *)img andBorder:(BOOL)border andSelector:(SEL)selector OfTarget:(id)target;
- (void)setRightBtnForNavBarWithImage:(UIImage *)img andSelector:(SEL)selector OfTarget:(id)target;

#pragma mark Add Left Views And Border Methods
- (void)addLeftViewToTextField: (UITextField *)txtFld withImage: (UIImage *)img;
- (void)addLeftViewToTextField: (UITextField *)txtFld withSpacerWidth:(CGFloat)width;
- (void)addRightViewToTextField: (UITextField *)txtFld withImage: (UIImage *)img;
- (void)addRightBorder: (UIView *)view;

#pragma mark Edit Placeholders Method
- (void)setTextField:(UITextField *)textField placeholderColor:(UIColor *)color;
- (void)FetchAndChangeTextAndPlaceholderColorToDefaultOfAllTextFieldsInView:(UIView *)view;
-(void)setCornerrRadius:(UITextField *)Txt;
-(void)edges:(UITextField *)Txt;


#pragma mark Handling Keyboard Actions
- (void)FetchAndResignAllTextFieldsInView:(UIView *)view;
- (void)setupKeyboardAvoidanceOnTarget:(id)target withSelectorForShow:(SEL)show andHide:(SEL)hide;
- (void)startKeyboardAvoidanceOnSelectedTextField:(UITextField *)selectedTextField WithNotification:(NSNotification *)notification OnTargetView:(UIView *)targetView;
- (void)finishKeyboardAvoidanceOnTargetView:(UIView *)targetView;

@end
