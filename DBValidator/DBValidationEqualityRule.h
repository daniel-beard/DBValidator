//
//  DBValidationEqualityRule.h
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "DBValidationRule.h"

@interface DBValidationEqualityRule : DBValidationRule

-(id) initWithObject1:(id)object1 object2: (id)object2 keyPath:(NSString *)keyPath failureMessage:(NSString *)failureMessage;

@end
