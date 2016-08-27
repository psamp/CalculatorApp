//
//  ViewController.m
//  CalculatorApp
//
//  Created by Princess Sampson on 8/25/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "ViewController.h"
#import "Operation.h"

@interface ViewController ()
@property(nonatomic, strong) Operation *operation;
@property (nonatomic, copy) NSString *operationSign;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.operation = [[Operation  alloc] init];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
