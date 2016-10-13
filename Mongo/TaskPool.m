//
//  TaskPool.m
//  Mongo
//
//  Created by zhujinhui on 16/10/12.
//  Copyright © 2016年 kyson. All rights reserved.
//

#import "TaskPool.h"

#import "MDSModel.h"

#import "User.h"

@implementation TaskPool

+(TaskPool *)sharedPool{
    static TaskPool *instance;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        instance = [[TaskPool alloc] init];
    });
    return instance;
}



-(void)doTaskWithName:(NSString *)taskName params:(NSDictionary *)params{
    NSLog(@"kyson");
    
    if ([taskName isEqualToString:SERVICE_DOUSERLOGIN]) {
        ;
    }
}

-(void)doTaskWithName:(NSString *)taskName params:(NSDictionary *)params object:(id) obj{
    NSLog(@"kyson");
    
    if ([taskName isEqualToString:SERVICE_DOUSERLOGIN]) {
        
        NSURLSessionConfiguration *defaultConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];

        NSURLSession *sessionWithoutADelegate = [NSURLSession sessionWithConfiguration:defaultConfiguration];
        NSURL *url = [NSURL URLWithString:@"http://www.baidu.com/"];
        
        [[sessionWithoutADelegate dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
            
            NSLog(@"Got response %@ with error %@.\n", response, error);
            
            NSLog(@"DATA:\n%@\nEND DATA\n",[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]);
            NSLog(@"currentThread :%@",[NSThread currentThread]);
            
            NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:obj,@"obj", nil];
            [self performSelectorOnMainThread:@selector(aaa:) withObject:dict waitUntilDone:YES];
            

            
        }] resume];
        
        [sessionWithoutADelegate invalidateAndCancel];
        /*
        NetworkResponse *response = [[NetworkResponse alloc] init];
        response .errorCode = ERRORCODE_NOERROR;
        response.rawDictionary = @{@"userName":@"kyson",@"token":@"lsadjfljd"};
        User *user = [[User alloc] init];
        [user loadPropertiesWithData:response.rawDictionary];
        response.responseObject = user;
        [obj serviceName:taskName response:response];*/
    }
}


-(void)aaa:(NSDictionary *) obj{
    id obj1 = obj[@"obj"];
    [obj1 serviceName:nil response:nil];
}

@end


@implementation NSObject (TaskPool)

-(void)doServiceWithName:(NSString *)taskName params:(NSDictionary *)params{
    [[TaskPool sharedPool] doTaskWithName:taskName params:(NSDictionary *)params object:self];
}


-(void)serviceName:(NSString *) serviceName response:(NetworkResponse *)response{


}


@end
