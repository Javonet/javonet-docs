use strict;
use warnings;
// <Import>
use aliased 'Javonet::Javonet' => 'Javonet';
// </Import>

// <WholeSnippet>
// <Activation>
Javonet->activate("your-email", "your-license-key");
// </Activation>

// <RuntimeContextCreation>
my $python_runtime = Javonet->in_memory()->python();
// </RuntimeContextCreation>

// <GetType>
my $python_type = $python_runtime->get_type("math")->execute();
// </GetType>

// <GetStaticField>
my $response = $python_type->get_static_field("pi")->execute();
// </GetStaticField>

// <GetValue>
my $result = $response->get_value();
print("$result\n");
// </GetValue>	
// </WholeSnippet>
