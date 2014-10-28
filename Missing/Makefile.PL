use ExtUtils::MakeMaker;

my $preop =
    'perl -MPod::Markdown -e \'Pod::Markdown->new->filter(@ARGV)\' $(VERSION_FROM) | tee $(DISTVNAME)/README > README.md;' .
    'pod2text $(VERSION_FROM) | tee $(DISTVNAME)/README > README;';

WriteMakefile(
              'NAME'         => 'CPAN::Test::Dummy::SCO::Missing',
              'VERSION_FROM' => 'bin/cpan-test-dummy-sco-missing', # finds $VERSION
              'EXE_FILES'    => [ 'bin/cpan-test-dummy-sco-missing' ],
	      'PREREQ_PM'    => {
				},
	      'META_MERGE' => {
			       resources => {
					     repository => 'http://github.com/szabgab/CPAN-Test-Dummy-SCO',
					    },
			      },
	      ($ExtUtils::MakeMaker::VERSION ge '6.31'? ('LICENSE'              => 'perl', ) : ()),
	      'clean'        => { FILES => 't/*.out t/test.cfg *~ */*~' },
	      MAN3PODS => {},
	      dist                => {
				      COMPRESS => 'gzip -9f',
				      SUFFIX => 'gz',
				      PREOP => $preop,
				     },
);
