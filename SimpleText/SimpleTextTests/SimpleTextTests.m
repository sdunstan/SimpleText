//
//  SimpleTextTests.m
//  SimpleTextTests
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "NSAttributedString+Builder.h"

@interface SimpleTextTests : XCTestCase

@end

@implementation SimpleTextTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testCenter
{
    
    NSAttributedString *doc = [NSAttributedString st_attributedStringWithBuilderHandler:^(STAttributedStringBuilder *builder) {
        [[builder center] writeParagraph:@"This is neat"];
    }];
    
    XCTAssertNotNil(doc, @"Doc should not be nil");
    
}

@end
