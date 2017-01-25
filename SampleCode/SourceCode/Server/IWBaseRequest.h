//
//  IWBaseRequest.h
//  SampleCode
//
//  Created by Kapil Bindal on 1/25/17.
//  Copyright © 2017 INNOW8. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IWBaseRequest : NSObject
+(instancetype)sharedInstance;
-(void)getListDataWithCompletionHandler:(void (^)(NSArray* dataArray, NSError* _Nullable connectionError)) handler;
@end
