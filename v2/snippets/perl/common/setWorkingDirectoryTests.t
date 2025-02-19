use strict;
use warnings;
use File::HomeDir;
use File::Spec;
use Test::More qw(no_plan);
use lib 'utils';
use aliased 'Javonet::Javonet' => 'Javonet';
use ActivationCredentials;

sub Test_SetWorkingDirectory {
    # <SetWorkingDirectory>
    # define path to be used as Javonet working directory
    my $user_home_directory = File::HomeDir->my_home;
    my $javonet_working_directory = File::Spec->catdir($user_home_directory, "myNewDirectory");

    # set Javonet working directory
    Javonet->set_javonet_working_directory($javonet_working_directory);

    # use Activate only once in your app
    Javonet->activate(ActivationCredentials::YOUR_LICENSE_KEY);

    # create other runtime context
    my $rtm_ctx = Javonet->in_memory()->netcore();

    # start interact with other runtime...
    my $response = $rtm_ctx->get_type("System.Math")->invoke_static_method("Abs", -13)->execute();
    my $result = $response->get_value();
    # </SetWorkingDirectory>
    is($result, 13, 'Abs(-13) == 13');
    ok(-e File::Spec->catfile($javonet_working_directory, "javonet.lic"), 'License file exists');
}

Test_SetWorkingDirectory();

done_testing();
