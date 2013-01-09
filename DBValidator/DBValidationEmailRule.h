//
//  DBValidationEmailRule.h
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationRegexRule.h"

@interface DBValidationEmailRule : DBValidationRegexRule

-(id) initWithObject:(id)object keyPath:(NSString *)keyPath failureMessage:(NSString *)failureMessage;

@end
