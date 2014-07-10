SimpleText
==========

Objective-C builder for creating attributed text strings.

This is not yet working software.

## TODO:
 1. Finish PoC.
 1. Write user manual. Documentation will drive API.
 1. Integrate BDD style tests (Kiwi?)
 1. Refactor the builder to build string ranges and apply styles at build time.
 1. Implement styles (bold, italics, etc)


Sample usage:

    NSAttributedString *doc =
      [NSAttributedString
        attributedStringWithObject:(id)object
                             block:^(AttributedStringBuilder *builder)
      {
          [builder withfontFamily: @"Helvetica"];
          [builder center [bold [underline [paragraph: obj.title]]]];
          [builder center                  [text: @"A Play in Two Acts\n\n"]];

          [builder center [link:@"#GEORGE" [text: @"GEORGE\n"]]];
          [builder                          text: @"I love you, Orange.\n"];
          [builder center [link:@"#ORANGE" [text: @"ORANGE\n"]]];
          [builder                          text: @"I love you too, George.\n"];
      }];
