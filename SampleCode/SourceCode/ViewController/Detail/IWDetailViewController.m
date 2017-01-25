//
//  IWDetailViewController.m
//  SampleCode
//
//  Created by Kapil Bindal on 1/25/17.
//  Copyright © 2017 INNOW8. All rights reserved.
//

#import "IWDetailViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface IWDetailViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageShow;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

@end

@implementation IWDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setupData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) setupData{
    [self.imageShow sd_setImageWithURL:[NSURL URLWithString:self.model.imageUrl]];
    self.titleLabel.text = self.model.name;
    self.priceLabel.text = [NSString stringWithFormat:@"$ %@", [self.model.price stringValue]] ;
    self.descriptionLabel.text = self.model.descriptionData;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:true];

}

@end
