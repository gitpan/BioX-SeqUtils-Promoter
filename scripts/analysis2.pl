#!/usr/bin/perl
#This will upload the output file from tcof_bio.pl into a sequences object 

use Tie::File;
use Bio::SeqIO;
use BioX::SeqUtils::Promoter::Sequence;
use BioX::SeqUtils::Promoter::Sequences;

$filename = '../data/nrab1000';

my ($filname) =@_;
my $text;
my $line;

my $testobj = BioX::SeqUtils::Promoter::Sequences->new();

open(IN,"<$filename");

<IN>;
while($text = <IN>){
	if($text =~/^$|^\s/){print "blank line\n"; next;}
	($key, $value) = split /\s+/, $text;
	$testobj->add_segment({label => $key, sequence => $value});       
}
my $seqs = $testobj->get_sequences();
foreach my $key (keys %$seqs ){ print $seqs->{$key}->get_sequence(),"\n"; }

end;



