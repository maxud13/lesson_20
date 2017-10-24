//
//  TableViewController.m
//  Lesson_20
//
//  Created by maxud on 20.10.2017.
//  Copyright © 2017 lesson_1. All rights reserved.
//

#import "TableViewController.h"
#import "GestsureViewController.h"


@interface TableViewController ()

@property (nonatomic,strong) NSArray *gestsures;
@property (nonatomic,strong) NSArray *animation;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.animation = @[@"Animation"];
    
    self.gestsures = @[@"UITapGestureRecognizer",
                         @"UIPinchGestureRecognizer",
                         @"UIRotationGestureRecognizer",
                         @"UISwipeGestureRecognizer",
                         @"UIPanGestureRecognizer",
                         @"UIScreenEdgePanGestureRecognizer",
                         @"UILongPressGestureRecognizer"];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return [self rowCountForSection:section];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    
    cell.textLabel.text = [self dataForINdexPath:indexPath];
   
    
    return cell;
}

#pragma mark - Table View Delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    if (indexPath.section == 0 )
    {
        GestsureViewController *gestsureVC = [storyboard instantiateViewControllerWithIdentifier:NSStringFromClass([GestsureViewController class])];
        
        gestsureVC.gestsureType = indexPath.row;
        gestsureVC.title = [self dataForINdexPath:indexPath];
        [self.navigationController pushViewController:gestsureVC animated:YES];
    }
    else
    {
        
    }
}

#pragma mark - Help Methods


- (NSString*)dataForINdexPath:(NSIndexPath*)indexPath
{
    NSInteger row = indexPath.row;
    return (indexPath.section == 0) ? self.gestsures[row] :self.animation[row];
}

-(NSInteger)rowCountForSection:(NSInteger)section
{
    return (section == 0) ? self.gestsures.count : self.animation.count;
}

@end
