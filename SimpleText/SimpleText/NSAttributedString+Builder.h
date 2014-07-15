//
//  NSAttributedString+Builder.h
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STAttributedStringBuilder.h"

@interface NSAttributedString (Builder)

+ (instancetype) attributedStringWithObject:(id)object block:(void (^) (STAttributedStringBuilder *builder, id object))callbackBlock;

@end
