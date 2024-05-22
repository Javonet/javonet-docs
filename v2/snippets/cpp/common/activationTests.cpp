#include <gtest/gtest.h>
#include "Javonet.h"
#include "ActivationCredentials.h"

using namespace JavonetNS::Cpp::Sdk;

namespace ActivationTests {
	TEST(Integration, Test_Activation_CorrectCredentials_Returns0) {
		remove("javonet.lic");
		// <Javonet_activate>
		auto result = Javonet::Activate(ActivationCredentials::yourLicenseKey);
		// </Javonet_activate>
		EXPECT_EQ((int)0, result);

		// <Javonet_activate_without_credentials>
		auto result2 = Javonet::Activate("");
		// </Javonet_activate_without_credentials>
		EXPECT_EQ((int)0, result2);
	}

}