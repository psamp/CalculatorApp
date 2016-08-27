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

@property (strong, nonatomic) IBOutlet UILabel *firstOperandAndAnswerLabel;
@property (strong, nonatomic) IBOutlet UILabel *secondOperandLabel;
@property (strong, nonatomic) IBOutlet UILabel *operationSignLabel;

@property(nonatomic, strong) Operation *operation;
@property (nonatomic, copy) NSString *operationSign;

- (IBAction)calculate:(UIButton*)sender;
- (IBAction)buildOperand:(UIButton*)sender;
- (IBAction)allClear:(UIButton*)sender;

- (void)updateLabel:(UILabel*)label with:(NSString*)text;
- (IBAction)updateSign:(UIButton*)sender;

- (NSString*)getStringFromNSInteger:(NSInteger)integer;

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


- (IBAction)calculate:(UIButton *)sender {
    
    NSString *chosenOperation = self.operationSignLabel.text;
    
    if ([chosenOperation isEqual: @"+"]) {
        [self.operation addition];
    } else if ([chosenOperation  isEqual: @"-"]) {
        [self.operation subtraction];
    } else if ([chosenOperation isEqual: @"×"]) {
        [self.operation multiplication];
    } else if ([chosenOperation isEqual: @"÷"]) {
        [self.operation division];
    }
    
    NSString *resultString = [self getStringFromNSInteger:self.operation.result];
    [self updateLabel:self.firstOperandAndAnswerLabel with:resultString];
    
    [self updateLabel:self.operationSignLabel with:@""];
    [self updateLabel:self.secondOperandLabel with:@""];
}

- (IBAction)buildOperand:(UIButton*)sender {
    NSInteger buttonValue = sender.currentTitle.integerValue;
    
    if ([@(self.operation.firstOperand) isEqual: @0]) {
        
        self.operation.firstOperand = buttonValue;
        NSString *firstOperandString = [self getStringFromNSInteger:self.operation.firstOperand];
        
        [self updateLabel:self.firstOperandAndAnswerLabel with:firstOperandString];
        
    } else if([@(self.operation.secondOperand) isEqual: @0]) {
        
        self.operation.secondOperand = buttonValue;
        
        NSString *secondOperandString = [self getStringFromNSInteger:self.operation.secondOperand];
        [self updateLabel:self.secondOperandLabel with:secondOperandString];
    }
}

- (IBAction)allClear:(UIButton*)sender {
    [self.operation reset];
    
    [self updateLabel:self.firstOperandAndAnswerLabel with:@"0"];
    [self updateLabel:self.secondOperandLabel with:@""];
    [self updateLabel:self.operationSignLabel with:@""];
}

- (IBAction)updateSign:(UIButton*)sender {
    self.operationSignLabel.text = sender.currentTitle;
}

- (void)updateLabel:(UILabel*)label with:(NSString*)text {
    label.text = text;
}

- (NSString*)getStringFromNSInteger:(NSInteger)integer {
    return [NSString stringWithFormat:@"%@", @(integer)];
}






@end
