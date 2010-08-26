#!/usr/bin/perl -w

use BioX::SeqUtils::Promoter::Annotations;
use BioX::SeqUtils::Promoter::Alignment;
use BioX::SeqUtils::Promoter::SaveTypes::RImage;
use BioX::SeqUtils::Promoter::Sequences;

my $promoter = BioX::SeqUtils::Promoter::Sequences->new();
my $alignment = BioX::SeqUtils::Promoter::Alignment->new();
my $cpromoter = BioX::SeqUtils::Promoter::Annotations->new({ type => 'Consensus'});
my $rimage = BioX::SeqUtils::Promoter::SaveTypes::RImage->new();

#$alignment->m_align({afilename => '/home/stephen/BioCapstone/BioX-SeqUtils-Promoter/data/rab1000_80_22.txt'});
$alignment->load_alignmentfile({filename => '/home/stephen/BioCapstone/BioX-SeqUtils-Promoter/data/p22_rab1000_80'});

#$promoter->set_sequences($alignment);
$cpromoter->set_reg({bases => $alignment->get_sequences()});
print "test\n";
$rimage->save({sequences => $alignment->get_sequences()});
exit;


