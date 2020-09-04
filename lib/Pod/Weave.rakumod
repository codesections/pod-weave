=begin pod

=head1 NAME

Pod::Weave - Weave documentation from Raku source

=head1 SYNOPSIS

Installation (assuming you already have L<Raku|ttps://raku.org/downloads> and
L<zef|https://github.com/ugexe/zef> installed):

=begin code :lang<sh>
zef install Pod::Weave
=end code

You can use Pod::Weave via it's command-line tool, C<pod-weave>

=begin code :lang<sh>

pod-weave source.raku > woven.md

=end code

=head1 DESCRIPTION

Pod::Weave renders documentation from Raku source files.  The documentation consists of
formatted pod blocks interwoven with formatted code blocks containing all of the source
code from the Raku file. The goal of doing so is to support basic L<literate
programming|https://en.wikipedia.org/wiki/Literate_programming> in Raku.  You can use
Pod::Weave to generate any of the output formats located in the Pod::Weave::To module.

For additional details, please see the announcement blog post:
L<www.codesections.com/blog/weaving-raku|https://www.codesections.com/blog/weaving-raku>.

=head1 AUTHOR

codesections <daniel@codesections.com>

=head1 COPYRIGHT AND LICENSE

ⓒ 2020 Daniel Sockwell

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
