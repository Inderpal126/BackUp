//
//  AppDelegate.h
//  BackUp
//
//  Created by Inder on 01/09/17.
//  Copyright © 2017 Inderpal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@property (retain, nonatomic) NSMutableArray *totalContact;

@end

