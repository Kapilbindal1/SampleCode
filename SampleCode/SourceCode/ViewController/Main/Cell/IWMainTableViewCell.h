//
//  IWMainTableViewCell.h
//  SampleCode
//
//  Created by Kapil Bindal on 1/25/17.
//  Copyright © 2017 INNOW8. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "IWPropertyModel.h"

@interface IWMainTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imageShow;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;
-(void)setup:(IWPropertyModel *)data;
@end
