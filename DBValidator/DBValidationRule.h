//
//  DBValidationRule.h
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

#import <Foundation/Foundation.h>

/** This class is the base class that all other validation rules are derived from. */
@interface DBValidationRule : NSObject

/** The object we are validating */
@property (nonatomic, weak) id object;
/** The keyPath of the value we are validating on the object */
@property (nonatomic, copy) NSString *keyPath;
/** The failure message when validation fails */
@property (nonatomic, copy) NSString *failureMessage;

/** Property that sets if the item being validated can be nil and still pass */
@property (nonatomic) BOOL canBeNil;

/** Base class init method. This is the designated constructor for this class.
 All subclasses should call this method in their custom init methods
 */
-(id) initWithObject: (id) object keyPath: (NSString*) keyPath failureMessage: (NSString*) failureMessage;

/** Base class method. By default returns YES. This method must be overriden each subclass */
-(BOOL) passesValidation;

@end
