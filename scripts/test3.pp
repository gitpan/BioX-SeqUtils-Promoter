#!/usr/bin/perl -w

use BioX::SeqUtils::Promoter::Sequence;

$string = 'AGCNNGTNGNCA';
$segment = 'TNNNNNCGAC';
my $sequence = BioX::SeqUtils::Promoter::Sequence->new({ label => 'tagstring', sequence => $string });
  
$sequence->add_segment({ segment => $segment });
my $string    = $sequence->get_sequence();
my $label     = $sequence->get_label();

print $sequence->get_sequence();

exit;


