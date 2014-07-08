//
//  AttributedStringBuilder.h
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AttributedStringBuilder : NSObject

-(AttributedStringBuilder*) withFontFamily:(NSString*)fontFamily;
-(AttributedStringBuilder*) center;
-(AttributedStringBuilder*) left;
-(AttributedStringBuilder*) right;
-(AttributedStringBuilder*) bold;
-(AttributedStringBuilder*) underline;
-(AttributedStringBuilder*) text:(NSString*)fontFamily;

-(NSAttributedString*)build;

@end
