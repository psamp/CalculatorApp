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
    }
    return self;
}

-(NSInteger)addition {
    return self.firstOperand + self.secondOperand;
}

-(NSInteger)subtraction {
    return self.firstOperand - self.secondOperand;
}

-(NSInteger)multiplication {
    return self.firstOperand * self.secondOperand;
}

-(NSInteger)division {
    NSInteger rtn = INT_MAX;
    
    if(self.secondOperand != 0) {
        rtn = self.firstOperand / self.secondOperand;
    }
    
    return rtn;
}

-(void)resetBothOperands {
    self.firstOperand = 0;
    self.secondOperand = 0;
}

@end
