//
//  NSAttributedString+Builder.m
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import "NSAttributedString+Builder.h"

@implementation NSAttributedString (Builder)

+ (instancetype) attributedStringWithBlock:(void (^) (AttributedStringBuilder *builder))callbackBlock
{
    AttributedStringBuilder *builder = [[AttributedStringBuilder alloc] init];
    
    callbackBlock(builder);
    return [builder build];
}

@end
