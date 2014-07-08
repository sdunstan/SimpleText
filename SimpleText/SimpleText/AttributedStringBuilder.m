//
//  AttributedStringBuilder.m
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import "AttributedStringBuilder.h"

@implementation AttributedStringBuilder

-(AttributedStringBuilder*) withFontFamily:(NSString*)fontFamily
{
    return self;
}

-(AttributedStringBuilder*) center
{
    return self;
}

-(AttributedStringBuilder*) left
{
    return self;
}

-(AttributedStringBuilder*) right
{
    return self;
}

-(AttributedStringBuilder*) bold
{
    return self;
}

-(AttributedStringBuilder*) underline
{
    return self;
}

-(AttributedStringBuilder*) text:(NSString*)fontFamily
{
    return self;
}


-(NSAttributedString*)build
{
    return nil;
}

@end
