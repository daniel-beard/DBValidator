//
//  DBValidationRule.m
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationRule.h"

@implementation DBValidationRule

-(id) initWithObject: (id) object keyPath: (NSString*) keyPath failureMessage: (NSString*) failureMessage {
    
    if (self = [super init]) {
        self.object = object;
        self.keyPath = keyPath;
        self.failureMessage = failureMessage;
    }
    return self;
    
}

-(BOOL) passesValidation {
    return YES;
}

@end
