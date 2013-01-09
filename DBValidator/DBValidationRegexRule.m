//
//  DBValidationRegexRule.m
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationRegexRule.h"

@interface DBValidationRegexRule ()

@property (nonatomic, copy) NSString *regexString;

@end

@implementation DBValidationRegexRule

-(id) initWithObject:(id)object keyPath:(NSString *)keyPath regex:(NSString *)regexString failureMessage:(NSString *)failureMessage {
    
    if (self = [super initWithObject:object keyPath:keyPath failureMessage:failureMessage]) {
        self.regexString = regexString;
    }
    return self;
}

-(BOOL) passesValidation {
    
    if (self.object == nil || self.keyPath == nil || self.regexString == nil) [NSException raise:@"Object or keypath or regex is nil" format:@"Object and keypath and regex must have a non-nil value"];
    
    NSString *stringToEvaluate = [self.object valueForKey:self.keyPath];
    
    NSPredicate *regexPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES[cd] %@", self.regexString];
    return [regexPredicate evaluateWithObject:stringToEvaluate];
    
}

@end
