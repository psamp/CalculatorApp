//
//  Operation.m
//  CalculatorApp
//
//  Created by Princess Sampson on 8/27/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import "Operation.h"

@implementation Operation

- (instancetype)init
{
    self = [super init];
    if (self) {
        _firstOperand = 0;
        _secondOperand = 0;
        _result = 0;
    }
    return self;
}

-(void)addition {
    self.result = self.firstOperand + self.secondOperand;
}

-(void)subtraction {
    self.result = self.firstOperand - self.secondOperand;
}

-(void)multiplication {
    self.result = self.firstOperand * self.secondOperand;;
}

-(void)division {
    
    if(self.secondOperand != 0) {
        self.result = self.firstOperand / self.secondOperand;
    }
}

-(void)reset {
    self.firstOperand = 0;
    self.secondOperand = 0;
    self.result = 0;
}

@end
