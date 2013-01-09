//
//  DBValidationStringLengthRule.h
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationRule.h"

@interface DBValidationStringLengthRule : DBValidationRule

-(id) initWithObject:(id)object keyPath:(NSString *)keyPath minStringLength: (NSUInteger) minLength maxStringLength: (NSUInteger) maxLength failureMessage:(NSString *)failureMessage;

@end
