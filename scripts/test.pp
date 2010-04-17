#!/usr/bin/perl -w

use BioX::SeqUtils::Promoter::Sequence;

my $promoter = BioX::SeqUtils::Promoter::Sequence->new();

$promoter->add_segment({segment=>'GTACACTGC'});
$promoter->add_segment({segment=>'GTACACTGC'});

print $promoter->get_sequence();


exit;


