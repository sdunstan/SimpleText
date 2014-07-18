//
//  STViewController.m
//  SimpleTextApp
//
//  Created by Stephen Dunstan on 7/15/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import "STViewController.h"

#import "NSAttributedString+Builder.h"

@interface STViewController ()

@end

@implementation STViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSAttributedString *doc = [NSAttributedString st_attributedStringWithBuilderHandler:^(STAttributedStringBuilder *builder) {
        [[builder center] writeParagraph:@"012"];
        [[[builder bold] write:@"456"] writeParagraph:@"789"];
        [[[builder bold] italics] writeParagraph:@"YES!"];
    }];
    
    [self.textView setAttributedText:doc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
