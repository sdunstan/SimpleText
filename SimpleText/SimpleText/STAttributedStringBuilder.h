//
//  AttributedStringBuilder.h
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


@interface STAttributedStringBuilder : NSObject

// Document level methods
-(STAttributedStringBuilder*) fontFamily:(NSString*)fontFamilyName withSize:(CGFloat)size;

// Paragraph level attributes
-(STAttributedStringBuilder*) left;
-(STAttributedStringBuilder*) center;
-(STAttributedStringBuilder*) right;
-(STAttributedStringBuilder*) justified;
-(STAttributedStringBuilder*) paragraphSpacingMultiplier:(CGFloat)spacing;

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

@end
