//
//  ViewController.m
//  DBValidator
//
//  Created by Daniel Beard on 9/01/13.
//  Copyright (c) 2013 Daniel Beard. All rights reserved.
//

#import "ViewController.h"
#import "DBValidator.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
   
    //String Length Rule
    
    DBValidationStringLengthRule *stringLengthRule = [[DBValidationStringLengthRule alloc] initWithObject:self.textFieldLength keyPath:@"text" minStringLength:3 maxStringLength:8 failureMessage:@"String length must be between 3 and 8"];
    [self.textFieldLength addValidationRule:stringLengthRule];
     
    
    //Regex Rule
    /*
    NSString *emailRegex =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    DBValidationRegexRule *regexRule = [[DBValidationRegexRule alloc] initWithObject:self.textField1 keyPath:@"text" regex:emailRegex failureMessage:@"Not a valid email address"];
    [self.textField1 addValidationRule:regexRule];
     */
    
    NSString *regexString = @"^[a-zA-Z]+$";
    DBValidationRegexRule *regexRule = [[DBValidationRegexRule alloc] initWithObject:self.textFieldRegex keyPath:@"text" regex:regexString failureMessage:@"Must be letters only"];
    [self.textFieldRegex addValidationRule:regexRule];
    
    //Email Rule
    DBValidationEmailRule *emailRule = [[DBValidationEmailRule alloc] initWithObject:self.textFieldEmail keyPath:@"text" failureMessage:@"Not a valid email address"];
    [self.textFieldEmail addValidationRule:emailRule];
   
#warning fix this later
    /*
    DBValidationNumberRangeRule *numberRangeRule = [[DBValidationNumberRangeRule alloc] initWithObject:self.textField1 keyPath:@"text" minNumberValue:20 maxNumberValue:100 failureMessage:@"Number must be between 20 and 100"];
    [self.textField1 addValidationRule:numberRangeRule];
    */
    
    //Equality Rule
    DBValidationEqualityRule *equalityRule = [[DBValidationEqualityRule alloc] initWithObject1:self.textField1 object2:self.textField2 keyPath:@"text" failureMessage:@"Both text fields must be equal"];
    [self.textField2 addValidationRule:equalityRule];
    
    
    
}

- (IBAction)validatePressed:(id)sender {
   
    NSMutableArray *failureMessages = [NSMutableArray array];
    NSArray *textFields = @[self.textField1, self.textField2, self.textFieldEmail, self.textFieldLength, self.textFieldRegex];
    for (id object in textFields) {
        [failureMessages addObjectsFromArray:[object validate]];
    }
    
    if (failureMessages.count > 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:[failureMessages componentsJoinedByString:@"\n"] delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alert show];
    }
    
}
@end
