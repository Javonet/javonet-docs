#include <gtest/gtest.h>
#include "Javonet.h"
#include "ActivationCredentials.h"
#include <filesystem>

using namespace JavonetNS::Cpp::Sdk;

int main(int argc, char* argv[]) {
	::testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}

namespace SetWorkingDirectoryTests {
	TEST(Integration, Test_SetWorkingDirectory) {
		// <SetWorkingDirectory>
		// Define path to be used as Javonet working directory
#ifdef _WIN32
		const char* userHomeDirectory = std::getenv("USERPROFILE");
#else
		const char* userHomeDirectory = std::getenv("HOME");
#endif
		std::string javonetWorkingDirectory = std::string(userHomeDirectory) + "/" + "myNewDirectory";

		// Set Javonet working directory
		Javonet::SetJavonetWorkingDirectory(javonetWorkingDirectory);

		// use Activate only once in your app
		Javonet::Activate(ActivationCredentials::yourLicenseKey);

		// Create other runtime context
		auto rtmCtx = Javonet::InMemory()->Netcore();

		// Start interact with other runtime...
		// </SetWorkingDirectory>
		auto response = rtmCtx->GetType("System.Math")->InvokeStaticMethod("Abs", -13)->Execute();
		auto result = std::any_cast<int>(response->GetValue());
		ASSERT_EQ(13, result);
		ASSERT_TRUE(std::filesystem::exists(javonetWorkingDirectory + "/javonet.lic"));
		ASSERT_TRUE(std::filesystem::exists(javonetWorkingDirectory + "/Binaries/Native"));
		ASSERT_TRUE(std::filesystem::exists(javonetWorkingDirectory + "/Binaries/Netcore"));
	}
}
