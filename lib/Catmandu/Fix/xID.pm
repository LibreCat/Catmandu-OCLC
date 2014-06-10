package Catmandu::Fix::xID;

use Catmandu::Sane;
use Catmandu::Util qw(:is);
use LWP::Simple;
use URI::Escape;
use Moo;
use Catmandu::Fix::Has;

has id      => (fix_arg => 1);
has type    => (fix_arg => 1);
has method  => (fix_arg => 1);

sub fix {
	my ($self,$data) = @_;
	my $id       = $self->id;
	my $type     = $self->type;
	my $method   = $self->method;
	my $value    = $data->{$id};

	if (is_string($value)) {
		$data->{$id} = &xid_service($value,$type,$method);
	}

	$data;
}


sub xid_service {
    my $query   = shift;
    my $type    = shift;
    my $method  = shift;

    die "usage: xid_service(query,type,method)" unless defined $query && 
                                                       defined $type &&
                                                       defined $method;

    my $endpoint;

    if ($type eq 'xisbn') {
    	$endpoint = 'http://xisbn.worldcat.org/webservices/xid/isbn'; 
    }
    elsif ($type eq 'xissn') {
    	$endpoint = 'http://xissn.worldcat.org/webservices/xid/issn';
    }
    elsif ($type eq 'xstandardNumber') {
   		$endpoint = 'http://xstandardNumber.worldcat.org/webservices/xid/oclcnum';
    }
    else {
    	$endpoint = 'http://xisbn.worldcat.org/webservices/xid/isbn';
    }

    my $request  = sprintf "%s/%s?method=%s&format=json&fl=*"
                            , $endpoint
                            , uri_escape($query)
                            , $method;

    my $response = get($request);
    my $json     = JSON->new->utf8(0);

    $json->decode($response);
}

=head1 NAME

Catmandu::Fix::xID - query the OCLC xID service

=head1 SYNOPSIS

	marc_map('020a','my.isbn')
	marc_map('022a','my.issn')
	marc_map('001_','my.oclc')

 	# Query an ISBN number for metadata
	xID('my.isbn','xisbn','getMetadata')

	# Query an ISBN number for editions
	xID('my.isbn','xisbn','getEditions')

	# Transform an ISBN to 13 digits
	xID('my.isbn','xisbn','to13')

	# Transform an ISBN to 10 digits
	xID('my.isbn','xisbn','to10')

	# Re-calculates the checksum digit of the request ISBN number
	xID('my.isbn','xisbn','fixCheckSum')

	# Add '-' (hyphen) character to an ISBN number.
	xID('my.isbn','xisbn','hyphen')

	# Retrieve metadata about an ISSN
	xID('my.issn','xissn','getMetadata')

	# Retrieve a list of ISSNs in same group as the requested ISSN.
	xID('my.issn','xissn','getEditions')

	# Retrieve a list of ISSNs in same group as the requested ISSN, 
	# as well as preceding/succeeding groups
	xID('my.issn','xissn','getHistory')

	# Retrieve a list of ISSNs and its production form information 
	# in same group as the requested ISSN.
	xID('my.issn','xissn','getForms')

	# Get metadata about a Standard Number
	xID('my.oclc','xstandardNumber','getMetadata')

	# Retrieve all edition information
	xID('my.oclc','xstandardNumber','getEditions')

	# Retrieve different variant OCLC numbers
	xID('my.oclc','xstandardNumber','getVariants')

=head1 DESCRIPTION

Submit an identifer such as an ISBN, ISSN, or OCLC Number to the OCLC xID service, and 
it returns a list of related identifiers and selected metadata.

Access of 1000 queries/day is available to anyone.

=head1 SEE ALSO

L<Catmandu::Fix>, L<Catmandu::MARC>x

=cut

1;