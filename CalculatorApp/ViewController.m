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
@property (strong, nonatomic) IBOutlet UIButton *clearButton;

@property(nonatomic, strong) Operation *operation;

- (IBAction)calculate:(UIButton*)sender;
- (IBAction)getOperand:(UIButton*)sender;
- (IBAction)convertOperandToPositiveOrNegative;
- (IBAction)clear;

- (void)updateViewFirstOperandAndAnswerLabel:(NSString*)firstOperandAndAnswer
                               secondOperand:(NSString*)secondOperand
                               operationSign:(NSString*)sign clearButton:(NSString *)clear
                              clearIsEnabled:(BOOL)clearIsEnabled;

- (void)updateModelFirstOperand:(NSInteger)firstOperand
                  secondOperand:(NSInteger)secondOperand;

- (IBAction)updateSign:(UIButton*)sender;
- (NSString*)getStringFromNSInteger:(NSInteger)integer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.operation = [[Operation  alloc] init];
    [self.clearButton setEnabled:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)updateViewFirstOperandAndAnswerLabel:(NSString *)firstOperandAndAnswer
                               secondOperand:(NSString *)secondOperand
                               operationSign:(NSString *)sign
                                 clearButton:(NSString *)clear
                              clearIsEnabled:(BOOL)clearIsEnabled {
    
    self.firstOperandAndAnswerLabel.text = firstOperandAndAnswer;
    self.secondOperandLabel.text = secondOperand;
    self.operationSignLabel.text = sign;
    
    [self.clearButton setTitle:clear forState:UIControlStateNormal];
    [self.clearButton setEnabled:clearIsEnabled];
}

- (void)updateModelFirstOperand:(NSInteger)firstOperand
                  secondOperand:(NSInteger)secondOperand {
    
    if(self.operation.firstOperand != firstOperand) {
        self.operation.firstOperand = firstOperand;
    }
    
    if(self.operation.secondOperand != secondOperand) {
        self.operation.secondOperand = secondOperand;
    }
}

- (IBAction)calculate:(UIButton *)sender {
    
    NSString *chosenOperation = self.operationSignLabel.text;
    NSString *resultString = [NSString string];
    
    if ([chosenOperation isEqualToString: @"+"]) {
        [self.operation addition];
    } else if ([chosenOperation  isEqualToString: @"−"]) {
        [self.operation subtraction];
    } else if ([chosenOperation isEqualToString: @"×"]) {
        [self.operation multiplication];
    } else if ([chosenOperation isEqualToString: @"÷"]) {
        [self.operation division];
        
        if(self.operation.secondOperand == 0) {
            resultString = @"Err";
        }
        
    }
    
    if(![resultString isEqual: @"Err"]) {
        resultString = [self getStringFromNSInteger:self.operation.result];
    }
    
    [self updateViewFirstOperandAndAnswerLabel:resultString
                                 secondOperand:@""
                                 operationSign:@""
                                   clearButton:@"AC"
                                clearIsEnabled:YES];
    
    [self updateModelFirstOperand:self.operation.result secondOperand:0];
}

- (IBAction)getOperand:(UIButton*)sender {
    NSString *buttonValue = sender.currentTitle;
    
    if ([self.operationSignLabel.text isEqualToString:@""]) {
        NSString *firstOperand = [self getStringFromNSInteger:self.operation.firstOperand];
        
        [self updateViewFirstOperandAndAnswerLabel:[firstOperand stringByAppendingString:buttonValue]
                                     secondOperand:self.secondOperandLabel.text
                                     operationSign:self.operationSignLabel.text
                                       clearButton:@"C"
                                    clearIsEnabled: YES];
        
    } else {
        NSString *secondOperand = [self getStringFromNSInteger:self.operation.secondOperand];
        
        [self updateViewFirstOperandAndAnswerLabel:self.firstOperandAndAnswerLabel.text
                                     secondOperand:[secondOperand stringByAppendingString:buttonValue]
                                     operationSign:self.operationSignLabel.text
                                       clearButton:@"C"
                                    clearIsEnabled:YES];
    }
    
    [self updateModelFirstOperand:self.firstOperandAndAnswerLabel.text.integerValue
                    secondOperand:self.secondOperandLabel.text.integerValue];
}

-(IBAction)convertOperandToPositiveOrNegative {
    
    NSInteger flippedOperand = 0;
    
    if([self.operationSignLabel.text isEqualToString:@""]) {
        flippedOperand = self.operation.firstOperand * -1;
        
        [self updateModelFirstOperand:flippedOperand
                        secondOperand:self.secondOperandLabel.text.integerValue];
    } else {
        flippedOperand = self.operation.secondOperand * -1;
        
        [self updateModelFirstOperand:self.operation.firstOperand
                        secondOperand:flippedOperand];
    }
    
    [self updateViewFirstOperandAndAnswerLabel: [self getStringFromNSInteger:self.operation.firstOperand]
                                 secondOperand: [self getStringFromNSInteger:self.operation.secondOperand]
                                 operationSign:self.operationSignLabel.text
                                   clearButton:self.clearButton.currentTitle
                                clearIsEnabled:YES];
    
}

- (IBAction)clear {
    
    if([self.clearButton.currentTitle  isEqualToString: @"AC"]) {
        [self.operation reset];
        
        [self updateViewFirstOperandAndAnswerLabel:@""
                                     secondOperand:@""
                                     operationSign:@""
                                       clearButton:@"AC"
                                    clearIsEnabled:NO];
        
    } else if([self.clearButton.currentTitle isEqualToString: @"C"]) {
        [self.operation clear];
        
        if([self.secondOperandLabel.text isEqualToString:@""]) {
            
            [self updateViewFirstOperandAndAnswerLabel: [self getStringFromNSInteger:self.operation.firstOperand]
                                         secondOperand:@""
                                         operationSign:self.operationSignLabel.text
                                           clearButton:@"AC"
             
                                        clearIsEnabled:YES];
        } else {
            
            [self updateViewFirstOperandAndAnswerLabel: [self getStringFromNSInteger:self.operation.firstOperand]
                                         secondOperand:[self getStringFromNSInteger:self.operation.secondOperand]
                                         operationSign:self.operationSignLabel.text
                                           clearButton:@"AC"
             
                                        clearIsEnabled:YES];
            
        }
    }
    
}

- (IBAction)updateSign:(UIButton*)sender {
    self.operationSignLabel.text = sender.currentTitle;
}

- (NSString*)getStringFromNSInteger:(NSInteger)integer {
    return [NSString stringWithFormat:@"%@", @(integer)];
}

@end
