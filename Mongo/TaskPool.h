//
//  TaskPool.h
//  Mongo
//
//  Created by zhujinhui on 16/10/12.
//  Copyright © 2016年 kyson. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NetworkResponse.h"

#define SERVICE_DOUSERLOGIN @"/service/doUserLogin/1"


@interface TaskPool : NSObject



-(void)doTaskWithName:(NSString *)taskName params:(NSDictionary *)params;

@end



@interface NSObject (TaskPool)

/**
 * 做服务
 */
-(void)doServiceWithName:(NSString *)taskName params:(NSDictionary *)params;
/**
 * 服务的返回
 */
-(void)serviceName:(NSString *) serviceName response:(NetworkResponse *)response;

@end
