unit module Pod::Weave::To::HTML:ver<0.0.1>;

use Pod::Literate;
use Pod::Load;
use Pod::To::HTML;

our sub weave-html(IO::Path $file --> Str) is export {
    my $line-number = 1;
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
    ==> {Pod::To::HTML.render($_)}()
}

=begin pod

=head1 NAME

Pod::Weave::To::Text - Weave plaintext documentation from Raku source

=head1 SYNOPSIS

You can use Pod::Weave::To::Text as a library:

=begin code :lang<raku>

use Pod::Weave::To::Text;
weave-text($filename.IO);

=end code

=head1 DESCRIPTION

Pod::Weave::To::Text renders plaintext documentation from Raku source files.  The
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
