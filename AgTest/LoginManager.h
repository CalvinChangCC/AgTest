//
//  LoginManager.h
//  AgTest
//
//  Created by Calvin Chang@Compal on 06/04/2017.
//  Copyright © 2017 CalvinChang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CurrentUser : NSObject

@property (strong, nonatomic) NSString *userName;
@property (strong, nonatomic) NSString *password;
@property (strong, nonatomic) NSString *token;

@end

@interface LoginManager : NSObject

@property (strong) CurrentUser *user;

+ (LoginManager *)sharedInstance;

- (void)login:(CurrentUser *)user keepLogin:(Boolean)keepLogin complete:(void (^)(Boolean isSuccess,NSDictionary * response))complete;
- (void)logout;

@end


