//
//  NSAttributedString+Builder.m
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import "NSAttributedString+Builder.h"

@implementation NSAttributedString (STSimpleText)

+(instancetype) st_attributedStringWithObject:(id)object builderHandler:(void (^) (STAttributedStringBuilder *builder, id object)) builderBlock
{
    // Create a builder to use in the provided callback.
    STAttributedStringBuilder *builder = [[STAttributedStringBuilder alloc] init];
    
    // Execute the callback
    builderBlock(builder, object);
    
    // return the results of the builder!
    return [builder build];
    
}

+(instancetype) st_attributedStringWithBuilderHandler:(void (^) (STAttributedStringBuilder *builder)) builderBlock
{
    // Create a builder to use in the provided callback.
    STAttributedStringBuilder *builder = [[STAttributedStringBuilder alloc] init];
    
    // Execute the callback
    builderBlock(builder);
    
    // return the results of the builder!
    return [builder build];
}


@end
