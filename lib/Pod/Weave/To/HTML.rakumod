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
    # If we want to allow customization, switch to the *sub* render(IO.Path, named-args)
    ==> { Pod::To::HTML.render($_) }()
}

=begin pod

=head1 NAME

Pod::Weave::To::HTML - Weave HTML documentation from Raku source

=head1 SYNOPSIS

You can use Pod::Weave::To::HTML as a library:

=begin code :lang<raku>

use Pod::Weave::To::HTML;
weave-html($filename.IO);

=end code

=head1 DESCRIPTION

Pod::Weave::To::HTML renders HTML documentation from Raku source files.  The documentation
consists of Pod blocks (rendered normally) interwoven with C«<pre></pre>» tags containing
the source code from the Raku file.  Pod::Weave::To::HTML currently formats output in the
same way as C<raku --doc=HTML> and does not allow for customization (customization may be
added in a future version).  Pod::Weave::To::HTML's goal is to support basic L<literate
programming|https://en.wikipedia.org/wiki/Literate_programming> in Raku.

For additional details, please see the announcement blog post:
L<www.codesections.com/blog/weaving-raku|https://www.codesections.com/blog/weaving-raku>.

=head1 AUTHOR

codesections <daniel@codesections.com>

=head1 COPYRIGHT AND LICENSE

ⓒ 2020 Daniel Sockwell

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

=end pod
