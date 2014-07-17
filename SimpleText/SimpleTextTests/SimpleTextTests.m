//
//  SimpleTextTests.m
//  SimpleTextTests
//
//  Created by Stephen Dunstan on 7/7/14.
//  Copyright (c) 2014 Stephen Dunstan. All rights reserved.
//

#import "Kiwi.h"
#import "NSAttributedString+Builder.h"

SPEC_BEGIN(SimpleTextSpec)


describe(@"Builder", ^{
    NSAttributedString *doc = [NSAttributedString st_attributedStringWithBuilderHandler:^(STAttributedStringBuilder *builder) {
            [[builder center] writeParagraph:@"012"];
            [[[builder bold] write:@"456"] writeParagraph:@"789"];
            [[[builder bold] italics] writeParagraph:@"YES!"];
        }];
    
    it(@"should create a doc", ^{
        [[theValue(doc) shouldNot] beNil];
    });
    
    it(@"should center the first paragraph", ^{
        NSObject *paragraphStyle = [doc attribute:NSParagraphStyleAttributeName atIndex:0 effectiveRange:NULL];
        [[paragraphStyle shouldNot] beNil];
        [[paragraphStyle should] beKindOfClass:[NSMutableParagraphStyle class]];
        NSParagraphStyle *paragraphStyleObject = (NSParagraphStyle*)paragraphStyle;
        [[theValue(paragraphStyleObject.alignment) should] equal:theValue(NSTextAlignmentCenter)];
    });
    
    it(@"should not center the second paragraph", ^{
        NSObject *paragraphStyle = [doc attribute:NSParagraphStyleAttributeName atIndex:4 effectiveRange:NULL];
        [[paragraphStyle should] beNil];
    });
    
    it(@"should bold and not italicize the first phrase of the second paragraph", ^{
        NSObject *fontAttribute = [doc attribute:NSFontAttributeName atIndex:4 effectiveRange:NULL];
        [[fontAttribute shouldNot] beNil];
        [[fontAttribute should] beKindOfClass:[UIFont class]];
        UIFontDescriptorSymbolicTraits traits = ((UIFont*)fontAttribute).fontDescriptor.symbolicTraits;
        [[theValue(traits&UIFontDescriptorTraitBold) should] equal:theValue(UIFontDescriptorTraitBold)];
        [[theValue(traits&UIFontDescriptorTraitItalic) shouldNot] equal:theValue(UIFontDescriptorTraitItalic)];
    });
    
    it(@"should not bold the second phrase of the second paragraph", ^{
        NSObject *fontAttribute = [doc attribute:NSFontAttributeName atIndex:7 effectiveRange:NULL];
        [[fontAttribute should] beNil];
    });
});


SPEC_END

