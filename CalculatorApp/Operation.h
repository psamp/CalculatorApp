//
//  Operation.h
//  CalculatorApp
//
//  Created by Princess Sampson on 8/27/16.
//  Copyright © 2016 Princess Sampson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Operation.h"

@interface Operation : NSObject

@property (nonatomic) NSInteger firstOperand;
@property (nonatomic) NSInteger secondOperand;
@property (nonatomic) NSInteger result;

-(void)reset;
-(void) addition;
-(void) subtraction;
-(void) multiplication;
-(void) division;

@end

