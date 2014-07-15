//
//  AttributedStringBuilder.m
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

/*
 // Phrase level attributes
 -(STAttributedStringBuilder*) bold;
 -(STAttributedStringBuilder*) underline;
 -(STAttributedStringBuilder*) italics;
 
 // Writes the provided text to the buffer and clears phrase level settings
 -(STAttributedStringBuilder*)write:(NSString*)string;
 -(STAttributedStringBuilder*)write:(NSString*)string withLink:(NSString*)uri;
 
 // Writes the provided text to the buffer and clears paragraph and phrase level settings
 -(void)writeParagraph:(NSString*)string;
 
 // Build the NSAttributedString
 -(NSAttributedString*)build;

 */


#import "STAttributedStringBuilder.h"
#import <CoreText/CoreText.h>

@implementation STAttributedStringBuilder

NSMutableArray *commandStack;
NSMutableDictionary *attributesMap;
UIFont *normalFont;
UIFont *boldFont;
UIFont *obliqueFont;

-(id)init
{
    self = [super init];
    
    if (self) {
        commandStack = [[NSMutableArray alloc] init];
        attributesMap = [[NSMutableDictionary alloc] init];
        
        normalFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        
    }
    
    return self;
}

-(void)pushCommandSelector:(SEL)selector withArgument:(id)arg
{
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:self];
    [invocation setSelector:selector];
    [invocation setArgument:&arg atIndex:2];
    [invocation retainArguments];
    
    [commandStack addObject:invocation];
}

-(void)pushCommandSelector:(SEL)selector
{
    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
    [invocation setTarget:self];
    [invocation setSelector:selector];
    
    [commandStack addObject:invocation];
}

-(STAttributedStringBuilder*) fontFamily:(NSString*)fontFamilyName withSize:(CGFloat)size;
{
    [self pushCommandSelector:@selector(addFontFamily:) withArgument:fontFamilyName];
    return self;
}

-(void) addFontFamily:(NSString*)fontFamily
{
    // TODO: this is where the actual font will be applied to the NSAttributedString
}

-(STAttributedStringBuilder*) center
{
    [self pushCommandSelector:@selector(_center)];
    return self;
}

-(void) _center
{
// TODO: create a paragraph style and add it to an attributes map
//    NSMutableParagraphStyle *centeredParagraphStyle = [[NSMutableParagraphStyle alloc]init];
//    centeredParagraphStyle.alignment = NSTextAlignmentCenter;
}

-(STAttributedStringBuilder*) left
{
    return self;
}

-(STAttributedStringBuilder*) right
{
    return self;
}

-(STAttributedStringBuilder*) justified
{
    return self;
}

-(STAttributedStringBuilder*) bold
{
    [attributesMap setObject: boldFont forKey:NSFontAttributeName];
    return self;
}

-(STAttributedStringBuilder*) underline
{
    [attributesMap setObject: @(NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
    return self;
}

-(STAttributedStringBuilder*) italics
{
    // TODO: only use the "obliqueness" attribute if there is no oblique version of the font.
    [attributesMap setObject:@(9) forKey:NSObliquenessAttributeName];
    return self;
}

-(STAttributedStringBuilder*) link:(NSString*)href
{
    return self;
}


-(STAttributedStringBuilder*) text:(NSString*)fontFamily
{
    return self;
}


-(NSAttributedString*)build
{
    return nil;
}

@end
