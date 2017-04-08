//
//  PreferenceManager.h
//  AgTest
//
//  Created by Calvin Chang@Compal on 4/08/17.
//  Copyright © 2017 CalvinChang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LoginManager.h"

@interface PreferenceManager : NSObject

- (void)writeLoginDataWithCurrentUser:(CurrentUser*)user;
- (CurrentUser *)getCurrentUser;
- (void) cleanLoginData;

@end
