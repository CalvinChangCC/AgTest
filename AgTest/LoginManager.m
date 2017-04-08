//
//  LoginManager.m
//  AgTest
//
//  Created by Calvin Chang@Compal on 06/04/2017.
//  Copyright © 2017 CalvinChang. All rights reserved.
//

#import "LoginManager.h"
#import <AFNetworking/AFNetworking.h>
#import <AFNetworking/AFHTTPSessionManager.h>
#import "PreferenceManager.h"

#define LOGIN_IP @"http://52.197.192.141:3443"

@implementation CurrentUser

@end

@interface LoginManager ()

@property (strong, nonatomic) AFHTTPSessionManager *sessionManager;
@property (strong, nonatomic) NSURLSessionTask *httpOperation;
@property (strong, nonatomic) CurrentUser *currentUser;

@end

@implementation LoginManager

+ (LoginManager *)sharedInstance {
    static LoginManager *instance = nil;
    @synchronized(self) {
        instance = [[self alloc] init];
    };
    return instance;
}

- (instancetype)init {
    if (self = [super init]) {
        [self sessionManagerInit];
    }
    return self;
}

- (void)sessionManagerInit {
    self.sessionManager = [[AFHTTPSessionManager alloc] init];
    self.sessionManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    self.sessionManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript",@"text/html", @"text/plain", nil];
    self.sessionManager.requestSerializer = [AFHTTPRequestSerializer serializer];
    [self.sessionManager.requestSerializer setTimeoutInterval:3];
}

- (void)login:(CurrentUser *)user keepLogin:(Boolean)keepLogin complete:(void (^)(Boolean isSuccess,NSDictionary * response))complete {
    NSDictionary *inputData = @{@"name" : @"ken", @"pwd" : @"hello"};
    NSLog(@"inputData is %@",inputData);
    self.httpOperation = [self.sessionManager POST:LOGIN_IP parameters:inputData progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSDictionary *response = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
        if(complete) {
            complete(YES,response);
            self.currentUser = user;
            if (keepLogin) {
                [self saveToPreference];
            }
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Login error :\n %@",error);
        if(complete)
            complete(NO,nil);
    }];
}

- (void)saveToPreference {
    PreferenceManager *manager = [[PreferenceManager alloc] init];
    [manager writeLoginDataWithCurrentUser:self.currentUser];
}

- (void)logout {
    PreferenceManager *manager = [[PreferenceManager alloc] init];
    [manager cleanLoginData];
}

@end
