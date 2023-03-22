#include <gtest/gtest.h>
#include "Javonet.h"
#include "ActivationCredentials.h"

using namespace JavonetNS::Cpp::Sdk;

namespace CppActivationTests {

	TEST(Integration, Test_Activation_WrongCredentials_Returns1) {
		remove("javonet.lic");
		auto result = Javonet::Activate("your@email.com", "your-licence-key");
		EXPECT_NE(0, result);
	}

	TEST(Integration, Test_Activation_CorrectCredentials_Returns0) {
		remove("javonet.lic");
		// <Javonet_activate>
		auto result = Javonet::Activate(ActivationCredentials::yourEmail, ActivationCredentials::yourLicenseKey);
		// </Javonet_activate>
		EXPECT_EQ(0, result);

		// <Javonet_activate_without_credentials>
		auto result2 = Javonet::Activate("", "");
		// </Javonet_activate_without_credentials>
		EXPECT_EQ(0, result2);
	}

}