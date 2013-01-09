//
//  NSObject+DBValidator.h
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DBValidator.h"

/** This category stores validation rules associated with an NSObject */
@interface NSObject (DBValidator)

/** Property that stores validation rules. Objects are associated with the objc_runtime */
@property (nonatomic, strong) NSMutableArray *validationRules;

/** Add a validation rule to the object */
-(void) addValidationRule: (DBValidationRule*) validationRule;
/** Clear all validation rules from the object */
-(void) removeAllValidationRules;

/** Validate against all validation rules.
 @return A mutable array containing the failure messages
 */
-(NSMutableArray*) validate;


@end
