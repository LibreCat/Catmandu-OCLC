package Catmandu::OCLC;

=head1 NAME

Catmandu::OCLC - Catmandu modules for working with OCLC web services

=cut

our $VERSION = '0.004';

=head1 SYNOPSIS

 marc_map('020a','my.isbn')
 xID('my.isbn','xisbn','getMetadata')

=head1 MODULES

=over

=item * L<Catmandu::Fix::xID>

=item * L<Catmandu::Fix::viaf_read>

=back

=head1 DESCRIPTION

With Catmandu, LibreCat tools abstract digital library and research services as data 
warehouse processes. As stores we reuse MongoDB or ElasticSearch providing us with 
developer friendly APIs. Catmandu works with international library standards such as 
MARC, MODS and Dublin Core, protocols such as OAI-PMH, SRU and open repositories such 
as DSpace and Fedora. And, of course, we speak the evolving Semantic Web.

Follow us on L<http://librecat.org> and read an introduction into Catmandu data 
processing at L<https://github.com/LibreCat/Catmandu/wiki>.

=head1 SEE ALSO

L<Catmandu>,
L<Catmandu::Importer>,
L<Catmandu::Fix>,
L<Catmandu::Store>

=head1 AUTHOR

Patrick Hochstenbach, C<< <patrick.hochstenbach at ugent.be> >>

=head1 LICENSE AND COPYRIGHT

This program is free software; you can redistribute it and/or modify it
under the terms of either: the GNU General Public License as published
by the Free Software Foundation; or the Artistic License.

See http://dev.perl.org/licenses/ for more information.

=cut

1;

