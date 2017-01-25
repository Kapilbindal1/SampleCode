//
//  IWBaseRequest.m
//  SampleCode
//
//  Created by Kapil Bindal on 1/25/17.
//  Copyright © 2017 INNOW8. All rights reserved.
//

#import "IWBaseRequest.h"
#import "IWPropertyModel.h"

@implementation IWBaseRequest

+(instancetype)sharedInstance{
    static IWBaseRequest* instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[IWBaseRequest alloc] init];
    });
    
    return instance;
}

-(void)getListDataWithCompletionHandler:(void (^)(NSArray* dataArray, NSError* _Nullable connectionError)) handler {
    NSURL *url = [NSURL URLWithString:@"http://api.nestoria.co.uk/api?country=uk&pretty=1&encoding=json&listing_type=buy&action=search_listings&page=1&place_name=london"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSDictionary *dataDic = [NSJSONSerialization JSONObjectWithData:data
                                                                      options:0
                                                                        error:NULL];
             NSDictionary* responseDic = dataDic[@"response"];
             NSArray* list = responseDic[@"listings"];
             NSMutableArray* returnArray = [NSMutableArray array];
             for(NSDictionary* listData in list){
                 IWPropertyModel* model = [IWPropertyModel new];
                 model.imageUrl = listData[@"img_url"];
                 model.name = listData[@"title"];
                 model.price = listData[@"price"];
                 [returnArray addObject:model];
             }
             handler(returnArray, nil);
         }
         else{
             handler(nil, connectionError);
         }
     }];
}

@end
