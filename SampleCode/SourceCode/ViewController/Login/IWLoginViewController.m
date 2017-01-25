//
//  IWLoginViewController.m
//  SampleCode
//
//  Created by Kapil Bindal on 1/25/17.
//  Copyright © 2017 INNOW8. All rights reserved.
//

#import "IWLoginViewController.h"
#import "IWBaseRequest.h"
#import "IWMainViewController.h"

#define segueMain   @"segue_main"

@interface IWLoginViewController ()<UITextFieldDelegate>
{
    __weak IBOutlet UIActivityIndicatorView *activityIndicator;
    NSArray* dataSendArray;
}

@property (weak, nonatomic) IBOutlet UITextField *emailIdText;
@property (weak, nonatomic) IBOutlet UITextField *passwordText;

@end

@implementation IWLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:segueMain]){
        IWMainViewController* vc = segue.destinationViewController;
        vc.tableDataArray = [dataSendArray mutableCopy];
    }
}


#pragma mark - UITextFieldDelegate

//To resign keyboard on return key pressed
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return true;
}


#pragma mark - Action
- (IBAction)loginButtonPressed:(id)sender {
    
    if([_emailIdText.text isEqualToString:@"contact@innow8apps.com"] && [_passwordText.text isEqualToString:@"Innow8123"]){
        
        [activityIndicator startAnimating];
        [self.view setUserInteractionEnabled:false];
        
        [[IWBaseRequest sharedInstance] getListDataWithCompletionHandler:^(NSArray *dataArray, NSError * _Nullable connectionError) {
            
            [activityIndicator stopAnimating];
            [self.view setUserInteractionEnabled:true];
            
            if(dataArray != nil){
                dataSendArray = dataArray;
                [self performSegueWithIdentifier:segueMain sender:self];
            }
            else{
                [self showAlertWithTitle:@"Network Issue" andMessage:@"Due to some network issue your request can't be processed. Please try again later."];
            }
        }];
    }
    else{
        [self showAlertWithTitle:@"Error" andMessage:@"Email Id or password is wrong. Please try again later."];
    }
    
    
}

- (void) showAlertWithTitle:(NSString *)title andMessage:(NSString *) message{
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* action = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    
    [alert addAction:action];
    
    [self presentViewController:alert animated:true completion:nil];
}

@end
