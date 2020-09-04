unit module Pod::Weave::To::Markdown:ver<0.0.1>;

use Pod::Literate;
use Pod::Load;
use Pod::To::Markdown;

our sub weave-markdown(IO::Path $file --> Str) is export {
    Pod::Literate.parsefile($file.IO).caps.map({
        when .key eq 'pod'  { ~.value }
         when .key eq 'code' { qq:to/EOF/ }
            =begin pod 
            =begin code :lang<raku> 
            {.value}
            =end code
            =end pod
            EOF
    }).join("\n")
    ==> load()
    ==> pod2markdown()
}

=begin pod

=head1 NAME

Pod::Weave::To::Markdown - Weave Markdown documentation from Raku source

=head1 SYNOPSIS

You can use Pod::Weave::To::Markdown as a library:

=begin code :lang<raku>

use Pod::Weave::To::Markdown;
weave-markdown($filename.IO);

=end code

=head1 DESCRIPTION

Pod::Weave::To::Markdown renders Markdown documentation from Raku source files.  The
documentation consists of Pod blocks (rendered normally) interwoven with code-fenced Code
blocks containing all of the source code from the Raku file. The goal of doing so is to
support basic L<literate programming|https://en.wikipedia.org/wiki/Literate_programming>
in Raku.

For additional details, please see the announcement blog post:
L<www.codesections.com/blog/weaving-raku|https://www.codesections.com/blog/weaving-raku>.

=head1 AUTHOR

codesections <daniel@codesections.com>

=head1 COPYRIGHT AND LICENSE

ⓒ 2020 Daniel Sockwell

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
