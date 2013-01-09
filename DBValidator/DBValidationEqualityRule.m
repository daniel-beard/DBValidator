//
//  DBValidationEqualityRule.m
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationEqualityRule.h"

@interface DBValidationEqualityRule ()

@property (nonatomic, weak) id object2;

@end

@implementation DBValidationEqualityRule

-(id) initWithObject1:(id)object1 object2: (id)object2 keyPath:(NSString *)keyPath failureMessage:(NSString *)failureMessage {
    
    if (self = [super initWithObject:object1 keyPath:keyPath failureMessage:failureMessage]) {
        self.object2 = object2;
    }
    return self;
}

-(BOOL) passesValidation {
    
    if (self.object == nil || self.keyPath == nil || self.object2 == nil) [NSException raise:@"Object or keypath is nil" format:@"Object and keypath must have a non-nil value"];
    return [[self.object valueForKey:self.keyPath] isEqual:[self.object2 valueForKey:self.keyPath]];
    
}

@end
