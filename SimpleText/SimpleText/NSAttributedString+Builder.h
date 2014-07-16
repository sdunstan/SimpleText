//
//  NSAttributedString+Builder.h
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "STAttributedStringBuilder.h"

@interface NSAttributedString (STSimpleText)

+(instancetype) st_attributedStringWithObject:(id)object builderHandler:(void (^) (STAttributedStringBuilder *builder, id object)) builderBlock;
+(instancetype) st_attributedStringWithBuilderHandler:(void (^) (STAttributedStringBuilder *builder)) builderBlock;

@end
