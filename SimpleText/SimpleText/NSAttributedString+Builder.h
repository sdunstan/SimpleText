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
/**-----------------------------------------------------------------------------
 * @name Creating an NSAttributedString object using a SimpleText builder
 * -----------------------------------------------------------------------------
 */
 
 /** Creates a NSAttributedString instance using a domain object and builder block
 *
 * This extension to NSAttributedString will do the work of creating a builder, allowing you a place
 * to call builder creational methods, and then calling build on the builder. It effectively eliminates
 * boilerplate code for using the builder.
 * 
 * This version of the extension takes a domain object of your choosing that can be used inside the block.
 *
 * @param object A domain object that is passed to your builder
 * @param builderBlock The block that will be used to create your text
 * 
 * @return A complete attributed string
 */
+(instancetype) st_attributedStringWithObject:(id)object builderHandler:(void (^) (STAttributedStringBuilder *builder, id object)) builderBlock;

/** Creates a NSAttributedString instance using a builder block
 *
 * The same as st_attributedStringWithObject: builderHandler: except no domain object is passed into the builder block.
 * 
 * @param builderBlock The block that will be used to create your text
 * 
 * @return A complete attributed string
 * 
 * @see +(instancetype) st_attributedStringWithObject: builderHandler:
 */
+(instancetype) st_attributedStringWithBuilderHandler:(void (^) (STAttributedStringBuilder *builder)) builderBlock;

@end
