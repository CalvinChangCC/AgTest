//
//  PreferenceManager.m
//  AgTest
//
//  Created by Calvin Chang@Compal on 4/08/17.
//  Copyright © 2017 CalvinChang. All rights reserved.
//

#import "PreferenceManager.h"

#define LOCAL_STORAGE_APP_GROUP_NAME @"group.agtest"
#define STORAGE_KEY_CURRENTUSER @"current_user"

@interface PreferenceManager()

@property (strong, nonatomic) NSUserDefaults *userDefault;

@end

@implementation PreferenceManager

- (instancetype)init {
    self = [super init];
    NSAssert(self!=nil, @"Can't init PreferenceManager");
    self.userDefault = [[NSUserDefaults alloc]initWithSuiteName:LOCAL_STORAGE_APP_GROUP_NAME];
    return self;
}

- (void)writeLoginDataWithCurrentUser:(CurrentUser *)user {

    [self.userDefault setObject:user forKey:STORAGE_KEY_CURRENTUSER];
}

- (CurrentUser *)getCurrentUser {
    return [self.userDefault objectForKey:STORAGE_KEY_CURRENTUSER];
}

- (void) cleanLoginData {
    [self.userDefault removeObjectForKey:STORAGE_KEY_CURRENTUSER];
}

@end
