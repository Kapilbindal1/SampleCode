//
//  IWMainTableViewCell.m
//  SampleCode
//
//  Created by Kapil Bindal on 1/25/17.
//  Copyright © 2017 INNOW8. All rights reserved.
//

#import "IWMainTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation IWMainTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


#pragma mark - Setup
-(void)setup:(IWPropertyModel *)data{
    
    [self.imageShow sd_setImageWithURL:[NSURL URLWithString:data.imageUrl]];
    self.titleLabel.text = data.name;
    self.descriptionLabel.text = [NSString stringWithFormat:@"$ %@", [data.price stringValue]] ;
}
@end
