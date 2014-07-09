//
//  NSAttributedString+Builder.m
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import "NSAttributedString+Builder.h"

@implementation NSAttributedString (Builder)

+ (instancetype) attributedStringWithObject:(id)object block:(void (^) (AttributedStringBuilder *builder, id object))callbackBlock
{
    // Create a builder to use in the provided callback.
    AttributedStringBuilder *builder = [[AttributedStringBuilder alloc] init];
    
    // Execute the callback
    callbackBlock(builder, object);
    
    // return the results of the builder!
    return [builder build];
}

@end
