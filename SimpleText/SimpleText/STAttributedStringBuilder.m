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

//NSMutableArray *commandStack;
NSMutableDictionary *attributesMap;
NSMutableAttributedString *doc;
UIFont *normalFont;
UIFont *boldFont;
UIFont *obliqueFont;

-(id)init
{
    self = [super init];
    
    if (self) {
//        commandStack = [[NSMutableArray alloc] init];
        attributesMap = [[NSMutableDictionary alloc] init];
        
        normalFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        
        doc = [[NSMutableAttributedString alloc]init];
    }
    
    return self;
}

//-(void)pushCommandSelector:(SEL)selector withArgument:(id)arg
//{
//    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
//    [invocation setTarget:self];
//    [invocation setSelector:selector];
//    [invocation setArgument:&arg atIndex:2];
//    [invocation retainArguments];
//    
//    [commandStack addObject:invocation];
//}
//
//-(void)pushCommandSelector:(SEL)selector
//{
//    NSMethodSignature *sig = [self methodSignatureForSelector:selector];
//    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sig];
//    [invocation setTarget:self];
//    [invocation setSelector:selector];
//    
//    [commandStack addObject:invocation];
//}

-(STAttributedStringBuilder*) fontFamily:(NSString*)fontFamilyName withSize:(CGFloat)size;
{
//    [self pushCommandSelector:@selector(_addFontFamily:) withArgument:fontFamilyName];
    return self;
}

//-(void) _addFontFamily:(NSString*)fontFamily
//{
//    // TODO: this is where the actual font will be applied to the NSAttributedString
//}

-(STAttributedStringBuilder*) center
{
    // [self pushCommandSelector:@selector(_center)];
    NSMutableParagraphStyle *centeredParagraphStyle = [[NSMutableParagraphStyle alloc]init];
    centeredParagraphStyle.alignment = NSTextAlignmentCenter;
    [attributesMap setObject:centeredParagraphStyle forKey:NSParagraphStyleAttributeName];

    return self;
}

//-(void) _center
//{
//    NSMutableParagraphStyle *centeredParagraphStyle = [[NSMutableParagraphStyle alloc]init];
//    centeredParagraphStyle.alignment = NSTextAlignmentCenter;
//    [attributesMap setObject:centeredParagraphStyle forKey:NSParagraphStyleAttributeName];
//}

-(STAttributedStringBuilder*) left
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentLeft;
    [attributesMap setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    return self;
}

-(STAttributedStringBuilder*) right
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentRight;
    [attributesMap setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
    return self;
}

-(STAttributedStringBuilder*) justified
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc]init];
    paragraphStyle.alignment = NSTextAlignmentJustified;
    [attributesMap setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    
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


// Writes the provided text to the buffer and clears phrase level settings
-(STAttributedStringBuilder*)write:(NSString*)string
{
    [doc appendAttributedString: [[NSAttributedString alloc] initWithString:string attributes:attributesMap]];
    [attributesMap removeObjectForKey:NSFontAttributeName];
    [attributesMap removeObjectForKey:NSUnderlineStyleAttributeName];
    [attributesMap removeObjectForKey:NSObliquenessAttributeName];
    return self;
    
}

-(STAttributedStringBuilder*)write:(NSString*)string withLink:(NSString*)uri
{
    return self;
}

// Writes the provided text to the buffer and clears paragraph and phrase level settings
-(void)writeParagraph:(NSString*)string
{
    [doc appendAttributedString: [[NSAttributedString alloc] initWithString:[string stringByAppendingString:@"\n"]
                                                                 attributes:attributesMap]];
    
    [attributesMap removeAllObjects];
}


-(NSAttributedString*)build
{
//    for(NSInvocation *invocation in commandStack)
//    {
//        [invocation invoke];
//    }
    
    return [[NSAttributedString alloc] initWithAttributedString:doc];
}

@end
