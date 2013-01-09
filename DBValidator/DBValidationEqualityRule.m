//
//  DBValidationEqualityRule.m
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
