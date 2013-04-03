	@uris = (
	"http://www.google.com",
	"http://www.yahoo.com",
	"http://www.bing.com"
	);

	use Time::HiRes qw(gettimeofday);
	use LWP::UserAgent;

	$userAgent = LWP::UserAgent->new;
	$userAgent->agent("HTTP-Res-Test/0.1 ");

	 ($timmer, $startWatch);
			
	 foreach (@uris) {
			
			$startWatch = gettimeofday();
			
			print "REQUESTING: [", $_ , "]", "\n";
					
			$REQUEST = HTTP::Request->new(GET => $_);
			$REQUEST->content_type('application/x-www-form-urlencoded');
			$REQUEST->content('query=libwww-perl&mode=dist');

			$RESPONSE = $userAgent->request($REQUEST);

				if ($RESPONSE->is_success) 
				{
						$timmer = gettimeofday() - $startWatch;
						# 4.9 is 2x the average response time according to Google sources
						$int = "4.90"; 
						
							printf ("RESPONSE TIME: [%.4f sec.]", $timmer ), "\n";
							print "\n";
						
						# if the web site is too slow, user will be warned.
						if ($timmer>=$int) {
							print "WARNING: [This website had a Response Time greater than ", $int , " seconds.]", "\n" ;
						}
				}
					
				else 
				{
							print "ERROR: [The requested resource is not available.]", "\n";
				}
			
			print "\n";


		}