use strict;
use warnings;
use Test::More qw(no_plan);
use lib 'utils';
use aliased 'Javonet::Javonet' => 'Javonet';
use ActivationCredentials;


sub Test_Activation_CorrectCredentials_Returns0 {
    # <Javonet_activate>
    my $result = Javonet->activate(ActivationCredentials::YOUR_EMAIL, ActivationCredentials::YOUR_LICENSE_KEY);
    # </Javonet_activate>
    return $result;
}

my $test_result_1 = Test_Activation_CorrectCredentials_Returns0();
is($test_result_1, 0, 'Test_Activation_CorrectCredentials_Returns0');

done_testing();
