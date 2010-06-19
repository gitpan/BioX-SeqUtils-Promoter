#!/usr/bin/perl -w

use BioX::SeqUtils::Promoter::Sequence;
use BioX::SeqUtils::Promoter::Sequences;
use BioX::SeqUtils::Promoter::SaveTypes::RImage;

my $tagged = BioX::SeqUtils::Promoter::Sequences->new();
my $rimage = BioX::SeqUtils::Promoter::SaveTypes::RImage->new();
my $base = [11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74];
my $base2 = [11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74];
my $color = ['red', 'red', 'red', 'blue', 'blue', 'blue', 'red' , 'red', 'red', 'red', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'red', 'red', 'red', 'blue', 'blue', 'blue', 'red' , 'red', 'red', 'red', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'red', 'red', 'red', 'red', 'red', 'red',  'red', 'red', 'red', 'red', 'red', 'red', 'red', 'red', 'red', 'blue', 'blue', 'blue', 'red' , 'red', 'red', 'red', 'blue', 'blue', 'blue', 'red', 'red', 'red', 'red'];
my $color2 = ['blue', 'blue', 'red', 'red', 'green', 'green', 'green', 'blue', 'blue', 'red', 'red', 'green', 'green', 'green', 'green', 'green', 'green', 'green', 'green', 'green', 'green', 'green', 'green', 'red' , 'red', 'red', 'red', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'blue', 'red', 'red', 'green', 'green', 'green', 'blue', 'red', 'red', 'green', 'green', 'green', 'green', 'red' , 'red', 'red', 'red', 'blue', 'blue',  'green', 'green', 'green', 'green', 'green', 'green', 'blue', 'blue', 'blue' ];

#my $DNA = 'CATATCTACTACECTCACTAAGCTGATCGAGCTAGCTACGTAGCATCGATCGCTAGCTAGTTTT';
my $DNA = 'ACTG' x 25;
#my $DNA2 = 'ACTTTTTCTAATCATATTTAATAGATGGGACGCGCGCGCGATCGATCGATCGATACTACTCCCC';
my $DNA2 = 'GTCA' x 25;

my $label =  'rab';
my $label2 =  'ras';

$tagged->add_sequence({sequence => $DNA, label => $label});

$tagged->set_color({bases => $base, colors => $color, label => $label});

my $seq_obj = $tagged->get_sequence({ label => $label });
my $seq     = $seq_obj->get_sequence();
print " SEQ: $seq (" . $tagged->length({ string => $seq }) . ")\n";

$tagged->add_sequence({sequence => $DNA2, label => $label2});
$tagged->set_color({bases => $base2, colors => $color2, label => $label2});

my $seq_obj = $tagged->get_sequence({ label => $label2 });
my $seq     = $seq_obj->get_sequence();
print " SEQ: $seq (" . $tagged->length({ string => $seq }) . ")\n";

my $seqs =  $tagged->get_sequences();
foreach my $label ( keys %$seqs ) {
	my $seq     = $seqs->{$label};
	my $seq_str = $seq->get_sequence();
	print "HERE: $seq_str (" . $tagged->length({ string => $seq_str }) . ")\n";
}

#my $testing = save($tagged);
$rimage->save({sequences => $tagged->get_sequences()});
	
exit;
	


