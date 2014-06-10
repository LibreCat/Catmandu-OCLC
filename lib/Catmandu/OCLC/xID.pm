package Catmandu::OCLC::xID;

use LWP::Simple;
use URI::Escape;
use JSON;

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

1;