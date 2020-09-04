NAME
====

Pod::Weave - Weave documentation from Raku source

SYNOPSIS
========

You can use Pod::Weave via it's command-line tool, `pod-weave`

```sh
pod-weave source.raku > woven.md
```

DESCRIPTION
===========

Pod::Weave renders documentation from Raku source files. The documentation consists of formatted pod blocks interwoven with formatted code blocks containing all of the source code from the Raku file. The goal of doing so is to support basic [literate programming](https://en.wikipedia.org/wiki/Literate_programming) in Raku. You can use Pod::Weave to generate any of the output formats located in the Pod::Weave::To module.

For additional details, please see the announcement blog post: [www.codesections.com/blog/weaving-raku](https://www.codesections.com/blog/weaving-raku).

AUTHOR
======

codesections <daniel@codesections.com>

COPYRIGHT AND LICENSE
=====================

ⓒ 2020 Daniel Sockwell

This library is free software; you can redistribute it and/or modify it under the Artistic License 2.0.

