//
//  DBValidationRegexRule.h
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationRule.h"

@interface DBValidationRegexRule : DBValidationRule

-(id) initWithObject:(id)object keyPath:(NSString *)keyPath regex: (NSString*) regexString failureMessage:(NSString *)failureMessage;

@end
