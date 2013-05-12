//
//  DBNumberRangeRuleTests.m
//  DBValidator
//
//  Created by Daniel Beard on 11/05/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import <SenTestingKit/SenTestingKit.h>
#import "DBDummyClass.h"
#import "DBValidator.h"

#define validation_message @"Number must be in the range 3 to 5"

@interface DBNumberRangeRuleTests : SenTestCase

@end

@implementation DBNumberRangeRuleTests

#pragma mark - NSInteger Tests

//Test passing integer validation
-(void) testPassingIntegerValidation {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self integerValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @4;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 0, @"Validation results should be empty");
}

//Test failing lower bound integer validation
-(void) testFailingLowerBoundIntegerValidation {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self integerValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @2;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 1, @"Validation results should have one entry");
}

//Test failing upper bound integer validation
-(void) testFailingUpperBoundIntegerValidation {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self integerValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @6;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 1, @"Validation results should have one entry");
}

//Test passing lower boundary integer validation {
-(void) testPassingLowerBoundIntegerValidation {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self integerValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @3;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 0, @"Validation results should be empty");
}

//Test passing upper boundary integer validation
-(void) testPassingUpperBoundIntegerValidation {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self integerValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @5;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 0, @"Validation results should be empty");
}

#pragma mark - Double Tests

//Test passing double validation
-(void) testPassingDoubleValidation {
 
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self doubleValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @4.55;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 0, @"Validation results should be empty");
}

//Test failing lower bound double validation
-(void) testFailingLowerBoundDoubleValidation {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self doubleValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @3.49;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 1, @"Validation results should have one entry");
}

//Test failing upper bound double validation
-(void) testFailingUpperBoundDoubleValidation {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self doubleValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @7.55;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 1, @"Validation results should have one entry");
}

//Test passing lower boundary double validation
-(void) testPassingLowerBoundDoubleValidation {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self doubleValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @3.5;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 0, @"Validation results should be empty");
}

//Test passing upper boundary double validation
-(void) testPassingUpperBoundDoubleValidation {
    
    DBDummyClass *object = [[DBDummyClass alloc] init];
    DBValidationNumberRangeRule *rule = [self doubleValidationRuleForObject:object];
    [object addValidationRule:rule];
    object.genericNumber = @7.5;
    
    NSMutableArray *validationResults = [object validate];
    STAssertTrue(validationResults.count == 0, @"Validation results should be empty");
}

#pragma mark - Helper Methods

-(DBValidationNumberRangeRule*) integerValidationRuleForObject: (id) object {
    
    DBValidationNumberRangeRule *rule = [[DBValidationNumberRangeRule alloc] initWithObject:object keyPath:@"genericNumber" minNumberValue:@3 maxNumberValue:@5 failureMessage:validation_message];
    return rule;
}

-(DBValidationNumberRangeRule*) doubleValidationRuleForObject: (id) object {
    
    DBValidationNumberRangeRule *rule = [[DBValidationNumberRangeRule alloc] initWithObject:object keyPath:@"genericNumber" minNumberValue:@3.5 maxNumberValue:@7.5 failureMessage:validation_message];
    return rule;
}

@end
