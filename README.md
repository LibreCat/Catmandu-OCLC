# NAME

Catmandu::OCLC - Catmandu modules for working with OCLC web services

# STATUS
[![Build Status](https://travis-ci.org/LibreCat/Catmandu-OCLC.svg)](https://travis-ci.org/LibreCat/Catmandu-OCLC)
[![Coverage Status](https://coveralls.io/repos/LibreCat/Catmandu-OCLC/badge.svg)](https://coveralls.io/r/LibreCat/Catmandu-OCLC)
[![Kwalitee Score](http://cpants.cpanauthors.org/dist/Catmandu-OCLC.png)](http://cpants.cpanauthors.org/dist/Catmandu-OCLC)

# SYNOPSIS

    add_field('number','102333412');
    do
       maybe();
       viaf_read('number');
       marc_map('700','author.$append')
       remove_field(record)
    end

# MODULES

- [Catmandu::Fix::xID](https://metacpan.org/pod/Catmandu::Fix::xID)
- [Catmandu::Fix::viaf\_read](https://metacpan.org/pod/Catmandu::Fix::viaf_read)

# DESCRIPTION

With Catmandu, LibreCat tools abstract digital library and research services as data
warehouse processes. As stores we reuse MongoDB or ElasticSearch providing us with
developer friendly APIs. Catmandu works with international library standards such as
MARC, MODS and Dublin Core, protocols such as OAI-PMH, SRU and open repositories such
as DSpace and Fedora. And, of course, we speak the evolving Semantic Web.

Follow us on [http://librecat.org](http://librecat.org) and read an introduction into Catmandu data
processing at [https://github.com/LibreCat/Catmandu/wiki](https://github.com/LibreCat/Catmandu/wiki).

# SEE ALSO

[Catmandu](https://metacpan.org/pod/Catmandu),
[Catmandu::Importer](https://metacpan.org/pod/Catmandu::Importer),
[Catmandu::Fix](https://metacpan.org/pod/Catmandu::Fix),
[Catmandu::Store](https://metacpan.org/pod/Catmandu::Store)

# AUTHOR

Patrick Hochstenbach, `<patrick.hochstenbach at ugent.be>`

# COPYRIGHT

This software is copyright (c) 2015 by Patrick Hochstenbach.
This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.
