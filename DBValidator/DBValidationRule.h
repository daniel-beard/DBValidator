//
//  DBValidationRule.h
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import <Foundation/Foundation.h>

/** This class is the base class that all other validation rules are derived from. */
@interface DBValidationRule : NSObject

/** The object we are validating */
@property (nonatomic, weak) id object;
/** The keyPath of the value we are validating on the object */
@property (nonatomic, copy) NSString *keyPath;
/** The failure message when validation fails */
@property (nonatomic, copy) NSString *failureMessage;

/** Base class init method. This is the designated constructor for this class.
 All subclasses should call this method in their custom init methods
 */
-(id) initWithObject: (id) object keyPath: (NSString*) keyPath failureMessage: (NSString*) failureMessage;

/** Base class method. By default returns YES. This method must be overriden each subclass */
-(BOOL) passesValidation;

@end
