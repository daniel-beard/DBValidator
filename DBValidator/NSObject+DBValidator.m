//
//  NSObject+DBValidator.m
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "NSObject+DBValidator.h"
#import <objc/objc-runtime.h>

#define VALIDATION_RULES_KEY @"validationruleskey"

@implementation NSObject (DBValidator)



-(void) setValidationRules:(NSMutableArray *)validationRules {
    objc_setAssociatedObject(self, VALIDATION_RULES_KEY, validationRules, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

-(NSMutableArray*) validationRules {
    NSMutableArray *validationRules = objc_getAssociatedObject(self, VALIDATION_RULES_KEY);
    if (!validationRules)
        validationRules = [NSMutableArray array];
    return validationRules;
}

-(void) addValidationRule: (DBValidationRule*) validationRule {
    
    NSMutableArray *validationRules = self.validationRules;
    if (validationRule)
        [validationRules addObject:validationRule];
    self.validationRules = validationRules;
}
    
-(void) removeAllValidationRules {
    NSMutableArray *validationRules = self.validationRules;
    [validationRules removeAllObjects];
    self.validationRules = validationRules;
}

-(NSMutableArray*) validate {
    NSMutableArray *failureMessages = [NSMutableArray array];
    for (DBValidationRule *rule in self.validationRules) {
        BOOL isValid = [rule passesValidation];
        if (!isValid)
            [failureMessages addObject: rule.failureMessage];
    }
    return failureMessages;
}

@end
