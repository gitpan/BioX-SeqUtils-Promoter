#!/usr/bin/perl
#This will upload the output file from tcof_bio.pl 

use Tie::File;
use Bio::SeqIO;


$filename = 'nrab1000';
#$results = &GetFileText($filename);


%hash = ();

my ($filname) =@_;
my $text;
my $line;

open(IN,"<$filename");

<IN>;
while($text = <IN>){

#	$text.= $line;
#	next if m/^\s*/;  ######################
	if($text =~/^$|^\s/){print "blank line\n"; next;}
#	push $hash, {split ' '};	

	($key, $value) = split /\s+/, $text;
	$hash{$key} .= $value;

}

foreach my $key (keys %hash){
print $key ." --> ". $hash{$key}."\n\n";
}

end;


##################################################
# Ex:   $text = &GetFileText($filename);
##################################################

sub GetFileText {
        my ($filename) = @_;
        my $text;

        open (IN, "<$filename");
        while (<IN>) {
                $text .= $_;
        }
        close(IN);

        return $text;
}

