//
//  ViewController.m
//  BackUp
//
//  Created by Inder on 01/09/17.
//  Copyright © 2017 Inderpal. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSMutableArray *sortedArray;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigation];
    sortedArray = [[NSMutableArray alloc] init];
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    NSLog(@"%@",appDelegate.totalContact);
    
    
    


    
    
    
    
    
    for (int i = 0; i< appDelegate.totalContact.count; i++){
        NSString *str = [[appDelegate.totalContact objectAtIndex:i] valueForKey:@"userName"];
        if (str) {
            [sortedArray addObject:[appDelegate.totalContact objectAtIndex:i]];
        }
    }
    NSLog(@"%@",sortedArray);
    [self.table_View reloadData];
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}
-(void)setNavigation{
    [[singleton_CommonUI sharedInstance] setNavigationBarImage:nil andTitle:@"All Contacts" withColor:[UIColor whiteColor] andVisibility:YES andTranslucency:YES forTarget:self];
    [self.navigationController.navigationBar setTitleTextAttributes: @{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont fontWithName:@"Raleway-SemiBold" size:18]}];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"sideMenu"] style:UIBarButtonItemStylePlain target:self action:@selector(sidemenu)];

}

-(void)sidemenu{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark-TableView
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return sortedArray.count;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 70;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil)
    {
        cell = (UITableViewCell *) [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    
    UILabel *nameLbl=(UILabel *)[cell viewWithTag:1];
    [nameLbl setText:[NSString stringWithFormat:@"%@", [[sortedArray objectAtIndex:indexPath.row] valueForKey:@"userName"]]];
    UIView *view = (UIView *)[cell viewWithTag:2];
    view.layer.cornerRadius = 25;
    view.layer.masksToBounds = YES;
    UIImageView *profileImage = (UIImageView *)[cell viewWithTag:3];
    NSData *data = [[sortedArray objectAtIndex:indexPath.row] valueForKey:@"image"];

    if ([data isEqual:@""]) {
       
    }else{
        UIImage  *img = [UIImage imageWithData:data scale:0.2];
        [profileImage  setImage:img];
    }
    
   

    return  cell;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]) {
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


@end
