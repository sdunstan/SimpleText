//
//  AttributedStringBuilder.m
//  SimpleText
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import "AttributedStringBuilder.h"
#import <CoreText/CoreText.h>
#import <UIKit/UIKit.h>

@implementation AttributedStringBuilder

NSMutableArray *commandStack;
NSMutableDictionary *attributesMap;
UIFont *normalFont;
UIFont *boldFont;

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

-(AttributedStringBuilder*) withFontFamily:(NSString*)fontFamily
{
    [self pushCommandSelector:@selector(addFontFamily:) withArgument:fontFamily];
    return self;
}

-(void) addFontFamily:(NSString*)fontFamily
{
    // TODO: this is where the actual font will be applied to the NSAttributedString
}

-(AttributedStringBuilder*) center
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
    [attributesMap setObject: boldFont forKey:NSFontAttributeName];
    return self;
}

-(AttributedStringBuilder*) underline
{
    [attributesMap setObject: @(NSUnderlineStyleSingle) forKey:NSUnderlineStyleAttributeName];
    return self;
}

-(AttributedStringBuilder*) link:(NSString*)href
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
