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
- (IBAction)getOperand:(UIButton*)sender;
- (IBAction)allClear:(UIButton*)sender;

- (void)updateViewFirstOperandAndAnswerLabel:(NSString*)firstOperandAndAnswer
                               secondOperand:(NSString*)secondOperand
                               operationSign:(NSString*)sign;

- (void)updateModelFirstOperand:(NSInteger)firstOperand
                  secondOperand:(NSInteger)secondOperand;

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

- (void)updateViewFirstOperandAndAnswerLabel:(NSString *)firstOperandAndAnswer
                               secondOperand:(NSString *)secondOperand
                               operationSign:(NSString *)sign {
    self.firstOperandAndAnswerLabel.text = firstOperandAndAnswer;
    self.secondOperandLabel.text = secondOperand;
    self.operationSignLabel.text = sign;
    
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
                                 operationSign:@""];
    [self updateModelFirstOperand:self.operation.result secondOperand:0];
}

- (IBAction)getOperand:(UIButton*)sender {
    NSString *buttonValue = sender.currentTitle;
    
    if ([self.operationSignLabel.text isEqual:@""]) {
        NSString *firstOperand = [self getStringFromNSInteger:self.operation.firstOperand];
        
        [self updateViewFirstOperandAndAnswerLabel:[firstOperand stringByAppendingString:buttonValue]
                                     secondOperand:self.secondOperandLabel.text
                                     operationSign:self.operationSignLabel.text];
        
    } else {
        NSString *secondOperand = [self getStringFromNSInteger:self.operation.secondOperand];
        
        [self updateViewFirstOperandAndAnswerLabel:self.firstOperandAndAnswerLabel.text
                                     secondOperand:[secondOperand stringByAppendingString:buttonValue]
                                     operationSign:self.operationSignLabel.text];
    }
    
    [self updateModelFirstOperand:self.firstOperandAndAnswerLabel.text.integerValue
                    secondOperand:self.secondOperandLabel.text.integerValue];
    
}

- (IBAction)allClear:(UIButton*)sender {
    [self.operation reset];
    [self updateViewFirstOperandAndAnswerLabel:@""
                                 secondOperand:@""
                                 operationSign:@""];
    
}

- (IBAction)updateSign:(UIButton*)sender {
    self.operationSignLabel.text = sender.currentTitle;
}

- (NSString*)getStringFromNSInteger:(NSInteger)integer {
    return [NSString stringWithFormat:@"%@", @(integer)];
}

@end
