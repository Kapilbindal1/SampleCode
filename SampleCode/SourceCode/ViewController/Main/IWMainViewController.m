//
//  IWMainViewController.m
//  SampleCode
//
//  Created by Kapil Bindal on 1/25/17.
//  Copyright © 2017 INNOW8. All rights reserved.
//

#import "IWMainViewController.h"
#import "IWMainTableViewCell.h"
#import "IWDetailViewController.h"

#define segue_detail  @"segue_detail"

@interface IWMainViewController ()<UITableViewDelegate, UITableViewDataSource>{
    
    IWPropertyModel* selectedModel;
}
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation IWMainViewController
@synthesize tableDataArray;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self initializeData];
}

-(void)initializeData{
    tableDataArray = [NSMutableArray array];
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
    
    if([segue.identifier isEqualToString:segue_detail]){
        IWDetailViewController* detail = segue.destinationViewController;
        detail.model = selectedModel;
    }
}


#pragma mark - TableView

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return tableDataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* cellIdentifier = @"cell_main";
    IWMainTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    [cell setup:[tableDataArray objectAtIndex:indexPath.row]];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    selectedModel = [tableDataArray objectAtIndex:indexPath.row];
    [self performSegueWithIdentifier:segue_detail sender:self];
}

#pragma mark - Action
- (IBAction)backButtonPressed:(id)sender {
    [self.navigationController popViewControllerAnimated:true];
}

@end
