//
//  DBStringLengthRuleTests.m
//  DBValidator
//
//  Created by Daniel Beard on 11/05/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DBDummyClass.h"
#import "DBValidator.h"

#define validation_message @"String must be between 5 and 10 characters"

@interface DBStringLengthRuleTests : SenTestCase

@end

@implementation DBStringLengthRuleTests

//Test expected case
-(void) testValidatesProperly {
   
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationStringLengthRule *rule = [self stringLengthRuleForObject:object];
    [object addValidationRule:rule];
    object.genericString = @"Test1";
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 0, @"Validation results should be empty");
}

//Test failing lower bound case
-(void) testFailingLowerBoundCase {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationStringLengthRule *rule = [self stringLengthRuleForObject:object];
    [object addValidationRule:rule];
    object.genericString = @"Test";
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 1, @"Validation results should contain one object");
}

//Test failing upper bound case
-(void) testFailingUpperBoundCase {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationStringLengthRule *rule = [self stringLengthRuleForObject:object];
    [object addValidationRule:rule];
    object.genericString = @"Test1234567";
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 1, @"Validation results should contain one object");
}

//Test lower boundary min length
-(void) testLowerBoundaryMinLength {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationStringLengthRule *rule = [self stringLengthRuleForObject:object];
    [object addValidationRule:rule];
    object.genericString = @"12345";
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 0, @"Validation results should be empty");
}

//Test upper boundary max length
-(void) testUpperBoundaryMaxLength {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationStringLengthRule *rule = [self stringLengthRuleForObject:object];
    [object addValidationRule:rule];
    object.genericString = @"1234567890";
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 0, @"Validation results should be empty");
}

//Test error message
-(void) testErrorMessage {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationStringLengthRule *rule = [self stringLengthRuleForObject:object];
    [object addValidationRule:rule];
    object.genericString = @"11";
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 1, @"Validation results should contain one object");
    STAssertTrue([validationResults[0] isEqualToString:validation_message], @"Error message does not match expected value");
}

#pragma mark - Helper Methods

-(DBValidationStringLengthRule*) stringLengthRuleForObject: (id) object {
    
    DBValidationStringLengthRule *rule = [[DBValidationStringLengthRule alloc]  initWithObject:object
                                                                                       keyPath:@"genericString"
                                                                               minStringLength:5
                                                                               maxStringLength:10
                                                                                failureMessage:validation_message];
    return rule;
}


@end
