use strict;
use warnings;
use Test::More;
use lib 'utils';
use aliased 'Javonet::Javonet' => 'Javonet';

sub Test_Channel_InMemory_Success {
    # <InMemoryChannel>
    # use Activate only once in your app
    Javonet->activate("your-license-key");

    my $communicationChannel = Javonet->in_memory();
    # use communicationChannel to create runtimes to interact with
    # </InMemoryChannel>
    ok(defined $communicationChannel, 'Test_Channel_InMemory_Success');
}

Test_Channel_InMemory_Success();

done_testing();