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

@property (nonatomic, readwrite) NSInteger firstOperand;
@property (nonatomic, readwrite) NSInteger secondOperand;
@property (nonatomic, readwrite) NSInteger result;

-(void)reset;
-(void) addition;
-(void) subtraction;
-(void) multiplication;
-(void) division;

@end

