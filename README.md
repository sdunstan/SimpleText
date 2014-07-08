SimpleText
==========

Objective-C builder for creating attributed text.

Sample usage:

    NSAttributedText *doc =
      [NSAttributedText attributedStringWithBlock:^(AttributedStringBuilder *builder) {
        builder.font = [UIFont fontWithName:@"Helvetica-Bold" size:12.0];
        builder.centered.bold.text = @"A Time For Clowns\n";
        builder.centered.text = @"A Play in Two Acts\n\n";
        builder.centered.text = @"GEORGE\n";
        builder.text = @"I love you, Orange.\n";
        builder.centered.text = @"ORANGE\n";
        builder.text = @"I love you too, George.\n";
      }];
