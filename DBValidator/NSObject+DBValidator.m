//
//  NSObject+DBValidator.m
//  DBValidator
//
/* @author daniel beard
 * http://danielbeard.wordpress.com
 * http://github.com/daniel-beard
 *
 * Copyright (C) 2013 Daniel Beard
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
 * WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */

#import "NSObject+DBValidator.h"
#import <objc/runtime.h>

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
