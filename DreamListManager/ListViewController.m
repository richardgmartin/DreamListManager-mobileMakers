//
//  ListViewController.m
//  DreamListManager
//
//  Created by Richard Martin on 2016-03-11.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "ListViewController.h"

@interface ListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property NSMutableArray *titlesArray;


@end

@implementation ListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.titlesArray = [[NSMutableArray alloc] init];

}

-(void)presentDreamEntry {
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Enter New List Item" message:nil preferredStyle:UIAlertControllerStyleAlert];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"Dream Title";
    }];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Save" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *textFieldOne = alertController.textFields[0];
        [self.titlesArray addObject:textFieldOne.text];
        [self.tableView reloadData];
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:saveAction];
    
    [self presentViewController:alertController animated:true completion:nil];
    
}

- (IBAction)onAddButtonTapped:(UIBarButtonItem *)sender {
    
    [self presentDreamEntry];
}


- (IBAction)onEditButtonTapped:(UIBarButtonItem *)sender {
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    cell.textLabel.text = [self.titlesArray objectAtIndex:indexPath.row];
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titlesArray.count;
    
}


@end
