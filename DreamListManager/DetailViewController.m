//
//  DetailViewController.m
//  DreamListManager
//
//  Created by Richard Martin on 2016-03-14.
//  Copyright © 2016 Richard Martin. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@property (weak, nonatomic) IBOutlet UITextView *dreamDescriptionTextView;

@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.title = self.titleString;
    self.dreamDescriptionTextView.text = self.descriptionString;
    
}



@end
