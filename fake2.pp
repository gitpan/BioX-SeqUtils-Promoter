#!/usr/bin/perl

my $r_code;
my @letters = qw(A C G T);
my @colors  = qw(black red green blue);
my $x_max   = 60;
my $y_max   = 25;

$r_code .= 'pdf(file="/home/roger/embry/fake2.pdf",onefile=FALSE,width=8,height=7,pointsize=10)' . "\n";
$r_code .= 'x=c(1,68)' . "\n";
$r_code .= 'y=c(1,25)' . "\n";
$r_code .= 'plot(x,y,adj=0,ann=FALSE,bty="n",mai=c(0,0,0,0),oma=c(0,0,0,0),pin=c(7,10),xaxt="n",yaxt="n",xpd=NA,col=c("000000"))' . "\n";

for ( my $j = $y_max; $j > 0; $j-- ) {
	my $start = int(rand(1000));
	my $end   = $start + 60;
	$r_code .= 'text(3,' . $j . ',"' . $start . '",adj=1,col=c("black"))' . "\n";
	for ( my $i = 5; $i <= $x_max + 4; $i++ ) {
		my $letter = $letters[int(rand(4))];
		my $color  = $colors[int(rand(4))];
		$r_code .= 'text(' . $i . ',' . $j . ',"' . $letter . '",adj=0,col=c("' . $color . '"))' . "\n";
	}
	$r_code .= 'text(66,' . $j . ',"' . $end . '",adj=0,col=c("black"))' . "\n";
}

$r_code .= 'dev.off()' . "\n";

print $r_code;

exit;

