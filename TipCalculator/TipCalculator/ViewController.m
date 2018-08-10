//
//  ViewController.m
//  TipCalculator
//
//  Created by Kyla  on 2018-08-10.
//  Copyright © 2018 Kyla . All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *billAmountTextField;



@property (weak, nonatomic) IBOutlet UIButton *tipCalculatingButton;

@property (weak, nonatomic) IBOutlet UISegmentedControl *tipPercentageSegmentControl;

@property (weak, nonatomic) IBOutlet UILabel *totalAmountLabel;

@property (weak, nonatomic) IBOutlet UILabel *totalTipAmountLabel;

@property (nonatomic, strong) NSArray *tipPercentagesArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tipPercentagesArray = @[@0.5, @0.10, @0.15, @0.18, @0.20];
    //////////making segment control
    while (self.tipPercentageSegmentControl.numberOfSegments > 0) {
        [self.tipPercentageSegmentControl removeSegmentAtIndex:0 animated:NO];
    }
 
    for (int i = 0; i < self.tipPercentagesArray.count; i++) {
        NSNumber *numberInArray = self.tipPercentagesArray[i];
        NSString *numberString = [NSString stringWithFormat:@"%.0f%%", numberInArray.doubleValue * 100];
        [self.tipPercentageSegmentControl insertSegmentWithTitle:numberString atIndex:i animated:NO];
    }
    
    [self.tipPercentageSegmentControl setSelectedSegmentIndex:0];
    self.billAmountTextField.text = @" ";
    self.billAmountTextField.keyboardType = UIKeyboardTypeNumberPad; 
    
}
////////////////adding the math calculations
-(void)calculateTipAndUpdateLabels {
    ///get the nsnumber out of the array
    NSNumber *tipPercentageNumber = self.tipPercentagesArray[[self.tipPercentageSegmentControl selectedSegmentIndex]];
    //configure variables to do math
    double billAmount = self.billAmountTextField.text.doubleValue;
    double tipPercentage = tipPercentageNumber.doubleValue;
    //do the math
    double tipAmount = billAmount * tipPercentage;
    double totalAmount = tipAmount + billAmount;
    ////updating the labels in the view
    self.totalTipAmountLabel.text = [NSString stringWithFormat:@"$%.2f", tipAmount];
    self.totalAmountLabel.text = [NSString stringWithFormat:@"$%.2f", totalAmount];
    
    
}


- (IBAction)tipButtonPressed:(UIButton *)sender {
    NSLog(@"did tap button");
    ////call the method on the button
    [self calculateTipAndUpdateLabels];
}




@end
