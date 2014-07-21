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

NSMutableDictionary *attributesMap;
NSMutableAttributedString *doc;
UIFont *normalFont;
UIFont *boldFont;
UIFont *obliqueFont;

-(id)init
{
    self = [super init];
    
    if (self) {
        attributesMap = [[NSMutableDictionary alloc] init];
        
        normalFont = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        boldFont = [UIFont boldSystemFontOfSize:[UIFont systemFontSize]];
        
        doc = [[NSMutableAttributedString alloc]init];
    }
    
    return self;
}

-(STAttributedStringBuilder*) fontFamily:(NSString*)fontFamilyName withSize:(CGFloat)size;
{
    return self;
}

-(STAttributedStringBuilder*) center
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *paragraphStyle) {
        paragraphStyle.alignment = NSTextAlignmentCenter;
    }];

    return self;
}

-(STAttributedStringBuilder*) left
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *paragraphStyle) {
        paragraphStyle.alignment = NSTextAlignmentLeft;
    }];
    
    return self;
}

-(STAttributedStringBuilder*) right
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *paragraphStyle) {
        paragraphStyle.alignment = NSTextAlignmentRight;
    }];
    
    return self;
}

-(STAttributedStringBuilder*) justified
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *paragraphStyle) {
        paragraphStyle.alignment = NSTextAlignmentJustified;
    }];
    
    return self;
}

-(STAttributedStringBuilder*) paragraphSpacingMultiplier:(CGFloat)spacing
{
    [self setParagraphStyleWithBlock:^(NSMutableParagraphStyle *paragraphStyle) {
        paragraphStyle.paragraphSpacing = [normalFont lineHeight] * spacing;
    }];
    return self;
}


-(void) setParagraphStyleWithBlock:(void (^) (NSMutableParagraphStyle *paragraphStyle)) paragraphStyleBlock
{
    NSMutableParagraphStyle *paragraphStyle = [attributesMap objectForKey:NSParagraphStyleAttributeName];
    if (paragraphStyle == nil)
    {
        paragraphStyle = [[NSMutableParagraphStyle alloc]init];
        [attributesMap setObject:paragraphStyle forKey:NSParagraphStyleAttributeName];
    }
    
    paragraphStyleBlock(paragraphStyle);
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
    [attributesMap setObject:@(0.25) forKey:NSObliquenessAttributeName];
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
    [attributesMap setObject:[NSURL URLWithString:uri] forKey:NSLinkAttributeName];
    [self write:string];
    [attributesMap removeObjectForKey:NSLinkAttributeName];
    
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
    return [[NSAttributedString alloc] initWithAttributedString:doc];
}

@end
