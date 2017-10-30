//
//  AppDelegate.m
//  BackUp
//
//  Created by Inder on 01/09/17.
//  Copyright © 2017 Inderpal. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (){
    NSMutableDictionary *contactValue;

}

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.totalContact = [[NSMutableArray alloc] init];
    [self getContact];
    return YES;
}

-(void)getContact{
    CNAuthorizationStatus status = [CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts];
    if(status == CNAuthorizationStatusDenied || status == CNAuthorizationStatusRestricted){
          NSLog(@"access denied");
    }else{
        CNContactStore *contactStore = [[CNContactStore alloc] init];
        NSArray *keys = [[NSArray alloc]initWithObjects:CNContactEmailAddressesKey,CNContactOrganizationNameKey,CNContactJobTitleKey,CNContactNoteKey,CNContactBirthdayKey, CNContactThumbnailImageDataKey, CNContactPhoneNumbersKey,CNContactEmailAddressesKey,CNContactTypeKey, CNContactViewController.descriptorForRequiredKeys,CNContainerIdentifierKey, nil];
        CNContactFetchRequest *request = [[CNContactFetchRequest alloc] initWithKeysToFetch:keys];
        request.predicate = nil;
        [contactStore enumerateContactsWithFetchRequest:request error:nil usingBlock:^(CNContact* __nonnull contact, BOOL* __nonnull stop){
            NSString *phoneNumber = @"";
            NSString *emailAddress = @"";
            if( contact.phoneNumbers)
                phoneNumber = [[[contact.phoneNumbers firstObject] value] stringValue];
            if( contact.emailAddresses)
                emailAddress = [[contact.emailAddresses firstObject] value];
            contactValue=[[NSMutableDictionary alloc] init];
            NSString *catStr;
            
            if ([contact.givenName isEqualToString:@""] && [contact.familyName isEqualToString:@""]) {
                [contactValue setObject: [[contact.emailAddresses firstObject] value]?:@"" forKey:@"userName"];
                [contactValue setValue:phoneNumber ?:@"" forKey:@"phoneNumber"];
                [contactValue setValue:emailAddress ?:@"" forKey:@"emailAddress"];
                [contactValue setObject:contact.identifier forKey:@"phoneIdentifier"];
                [contactValue setObject:contact.organizationName ?:@"" forKey:@"organizationName"];
                [contactValue setObject:contact.jobTitle ?:@"" forKey:@"jobTitle"];
                [contactValue setObject:contact.note ?:@"" forKey:@"note"];
                [contactValue setObject:contact.givenName ?:@"" forKey:@"firstName"];
                [contactValue setObject:contact.familyName ?:@"" forKey:@"lastName"];
                [contactValue setObject:contact.thumbnailImageData ?:@"" forKey:@"image"];
            }else{
                [contactValue setValue:phoneNumber ?:@"" forKey:@"phoneNumber"];
                [contactValue setValue:emailAddress   ?:@"" forKey:@"emailAddress"];
                [contactValue setObject:contact.identifier forKey:@"phoneIdentifier"];
                [contactValue setObject:contact.organizationName ?:@"" forKey:@"organizationName"];
                [contactValue setObject:contact.jobTitle ?:@"" forKey:@"jobTitle"];
                [contactValue setObject:contact.note ?:@"" forKey:@"note"];
                [contactValue setObject:contact.givenName ?:@"" forKey:@"firstName"];
                [contactValue setObject:contact.familyName ?:@"" forKey:@"lastName"];
                [contactValue setObject:contact.thumbnailImageData ?:@"" forKey:@"image"];

                if ([[[NSUserDefaults standardUserDefaults] valueForKey:@"inderPath"] integerValue]==1) {
                    if ([contact.familyName isEqualToString:@""]) {
                        catStr=[NSString stringWithFormat:@"%@", contact.givenName];
                    }else if ([contact.givenName isEqualToString:@""]){
                        catStr=[NSString stringWithFormat:@"%@ ",contact.familyName];
                    }else{
                        catStr=[NSString stringWithFormat:@"%@ %@", contact.familyName,contact.givenName];
                    }
                }else{
                    if ([contact.familyName isEqualToString:@""] && ![contact.givenName isEqualToString:@""]) {
                        catStr=[NSString stringWithFormat:@"%@", contact.givenName];
                    }else if ([contact.givenName isEqualToString:@""] && ![contact.familyName isEqualToString:@""]){
                        catStr=[NSString stringWithFormat:@"%@", contact.familyName];
                        
                    }else{
                        catStr=[NSString stringWithFormat:@"%@ %@", contact.givenName,contact.familyName];
                    }
                }
                [contactValue setObject:catStr forKey:@"userName"];
            }
            [self.totalContact addObject:contactValue];
        }];
        NSLog(@"%@",self.totalContact);
    }
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"BackUp"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
