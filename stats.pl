use 5.010;

open my $logfile, 'OT5logs.rtf' or die "I couldn't get at OT5logs.rtf: $!";
my $date = qr/\d{4}-\d{2}-\d{2}/;
my $time = qr/\d{2}:\d{2}:\d{2}\.\d{3}/;
my $fillers = qr/.*?/;
my $anchor = qr/logTrackStats/;

my $bytesSent = qr/bytesSent/;
my %bytesSentHash = ();
open my $output, '>', 'OTCsvLogs.txt' or die "error trying to overwrite csv file: $!";

for my $line (<$logfile>) {
	

		if ($line =~ /^($date)($fillers)($time)($fillers)($anchor)($fillers)(\w+)=(\d+)/) 
		{
			my $key = "$1 $3";

			if($7 =~ /$bytesSent/)
			{
				 #print "In bytesSent","$key";
				 #$bytesSentHash($key) = $8; 
			} else
			{
				$name = "$1,$3,$7,$8";	
				print "$name","\n";
        		#print $output "$name","\n";
            }
    	}
    	

}

print "$_ $bytesSentHash($_)\n" for (keys %bytesSentHash);
close $output;
close $logfile;