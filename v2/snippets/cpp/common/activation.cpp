#include <gtest/gtest.h>
#include "Javonet.h"
#include "ActivationCredentials.h"

using namespace JavonetNS::Cpp::Sdk;

namespace CppActivationTests {

#ifdef _WIN32
	auto currentWorkingDir = _getcwd(nullptr, 0);
#else
	auto currentWorkingDir = getcwd(nullptr, 0);
#endif //_WIN32

	TEST(Integration, Test_Activation_CorrectCredentials_Returns0) {
		remove("javonet.lic");
		// <Javonet_activate>
		auto result = Javonet::Activate(ActivationCredentials::yourEmail, ActivationCredentials::yourLicenceKey);
		// </Javonet_activate>
		EXPECT_EQ(0, result);
	}

	TEST(Integration, Test_Activation_LicenceFile_Returns0) {
		auto result = Javonet::Activate("","");
		EXPECT_EQ(0, result);
	}
}