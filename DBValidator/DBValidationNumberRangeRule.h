//
//  DBValidationNumberRangeRule.h
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationRule.h"

@interface DBValidationNumberRangeRule : DBValidationRule

-(id) initWithObject:(id)object keyPath:(NSString *)keyPath minNumberValue: (double) minValue maxNumberValue: (double) maxValue failureMessage:(NSString *)failureMessage;

@end
