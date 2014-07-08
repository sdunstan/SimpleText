SimpleText
==========

Objective-C builder for creating attributed text.

Sample usage:

    NSAttributedText *doc =
      [NSAttributedText attributedStringWithBlock:^(AttributedStringBuilder *builder) {
        [builder withfontFamily: @"Helvetica"];
        [builder center [bold [underline [text: @"A Time for Clowns\n"]]]];
        [builder center                  [text: @"A Play in Two Acts\n\n"]];

        [builder center                  [text: @"GEORGE\n"]];
        [builder                          text: @"I love you, Orange.\n"];
        [builder center                  [text: @"ORANGE\n"]];
        [builder                          text: @"I love you too, George.\n"];
      }];
