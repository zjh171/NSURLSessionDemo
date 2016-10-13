//
//  NetworkResponse.h
//  Mongo
//
//  Created by zhujinhui on 16/10/12.
//  Copyright © 2016年 kyson. All rights reserved.
//

#import <Foundation/Foundation.h>


#define ERRORCODE_NOERROR 1000



@interface NetworkResponse : NSObject


@property (nonatomic, assign) NSInteger errorCode;

@property (nonatomic, copy) NSString *errorMessage;

@property (nonatomic, strong) NSDictionary *rawDictionary;

@property (nonatomic, strong) NSDictionary *rawArray;

@property (nonatomic, strong) id responseObject;



@end
