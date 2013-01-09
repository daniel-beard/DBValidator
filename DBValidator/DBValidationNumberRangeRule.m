//
//  DBValidationNumberRangeRule.m
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationNumberRangeRule.h"

@interface DBValidationNumberRangeRule ()

@property (nonatomic, assign) double minValue;
@property (nonatomic, assign) double maxValue;

@end

@implementation DBValidationNumberRangeRule

-(id) initWithObject:(id)object keyPath:(NSString *)keyPath minNumberValue:(double)minValue maxNumberValue:(double)maxValue failureMessage:(NSString *)failureMessage {
    
    if (self = [super initWithObject:object keyPath:keyPath failureMessage:failureMessage]) {
        self.minValue = minValue;
        self.maxValue = maxValue;
    }
    return self;
}

-(BOOL) passesValidation {
    
    if (self.object == nil || self.keyPath == nil) [NSException raise:@"Object or keypath is nil" format:@"Object and keypath must have a non-nil value"];
    
    double numberValue = [[self.object valueForKey:self.keyPath] doubleValue];
    
    if (numberValue < self.minValue) return NO;
    if (numberValue > self.maxValue) return NO;
    
    return YES;
}

@end
