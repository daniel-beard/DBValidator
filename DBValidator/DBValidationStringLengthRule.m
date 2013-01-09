//
//  DBValidationStringLengthRule.m
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationStringLengthRule.h"

@interface DBValidationStringLengthRule ()

@property (nonatomic) NSUInteger minLength;
@property (nonatomic) NSUInteger maxLength;

@end

@implementation DBValidationStringLengthRule

-(id) initWithObject:(id)object keyPath:(NSString *)keyPath minStringLength: (NSUInteger) minLength maxStringLength: (NSUInteger) maxLength failureMessage:(NSString *)failureMessage {
    
    if (self = [super initWithObject:object keyPath:keyPath failureMessage:failureMessage]) {
        self.minLength = minLength;
        self.maxLength = maxLength;
    }
    return self;
}

-(BOOL) passesValidation {
    
    if (self.object == nil || self.keyPath == nil) [NSException raise:@"Object or keypath is nil" format:@"Object and keypath must have a non-nil value"];
    
    NSUInteger length = [[self.object valueForKey:self.keyPath] length];
    
    //Lower Bounds
    if (length < self.minLength) return NO;
    //Upper Bounds
    if (length > self.maxLength) return NO;
    
    return YES;
}

@end
