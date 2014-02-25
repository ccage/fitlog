//
//  fitlogIntegrationTests.m
//  fitlogIntegrationTests
//
//  Created by CCage on 2/25/14.
//  Copyright (c) 2014 109Software. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "FLUser.h"
#import "FLActivityType.h"

//#define PF_APP_ID @"9ILuGQbYRPPCjss1Y1yPnto5MLjxz1iYshSc5Fz8"
//#define PF_CLIENT_KEY @"seD1rhtS5UjYI6hsJWLORZ6aDhlyaDNnHoGivEXL"

#define PF_APP_ID @"LlLxxipirAQ2m4zH21OZnAfeWv6mbGJMji3XjjvF"
#define PF_CLIENT_KEY @"3i8UeliXYAeOpghU8Zr9313n9SMieGjE0jzRD7H5"

#define TW_CONSUMER_KEY @"obowSmqbwl11dS09Iuc1Dw"
#define TW_CONSUMER_SECRET @"tVlfTk1FzlRN7zAAn9DYNd8mSImxWBCJctLRXBNN0U"

@interface fitlogIntegrationTests : XCTestCase

@end

@implementation fitlogIntegrationTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.

    [FLUser registerSubclass];
    [FLActivityType registerSubclass];
    
    [Parse setApplicationId:PF_APP_ID clientKey:PF_CLIENT_KEY];
 //   [PFFacebookUtils initializeFacebook];
 //   [PFTwitterUtils initializeWithConsumerKey:TW_CONSUMER_KEY consumerSecret:TW_CONSUMER_SECRET];
    
    // Set default ACLs
    PFACL *defaultACL = [PFACL ACL];
    [defaultACL setPublicReadAccess:YES];
    [PFACL setDefaultACL:defaultACL withAccessForCurrentUser:YES];
    
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample
{
    PFQuery *query = [PFQuery queryWithClassName:@"ActivityType"];
    [query whereKey:@"isActive" equalTo:@YES];
    NSArray *ret = [query findObjects];
    
    int myint = [ret count];
    
    NSLog(@"Objects retrieved: %d", myint);
    
    if (myint > 0) {
        FLActivityType * myActivity = ret[0];
        
        NSLog(@"Activity name: %@", [myActivity name] );
  
    }
    
    //XCTFail(@"No implementation for \"%s\"", __PRETTY_FUNCTION__);
}

@end
