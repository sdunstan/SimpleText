SimpleText
==========

Objective-C builder for creating attributed text strings.

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
