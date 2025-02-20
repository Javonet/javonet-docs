#include <gtest/gtest.h>
#include "Javonet.h"
#include "ActivationCredentials.h"
#include <filesystem>

using namespace JavonetNS::Cpp::Sdk;

int main(int argc, char* argv[]) {
	::testing::InitGoogleTest(&argc, argv);
	return RUN_ALL_TESTS();
}

namespace ChannelTests {

	const auto currentWorkingDir = std::filesystem::current_path();
	const auto resourcesDirectory = currentWorkingDir.string() + "/testResources/configuration-file";

	TEST(Integration, Test_Channel_InMemory_Success) {
		// <InMemoryChannel>
		// use Activate only once in your app
		Javonet::Activate(ActivationCredentials::yourLicenseKey);

		auto communicationChannel = Javonet::InMemory();
		// use communicationChannel to create runtimes to interact with
		// </InMemoryChannel>
		EXPECT_NE(nullptr, communicationChannel);
	}

	// Test_Channel_Tcp_Success

	TEST(Integration, Test_Channel_WithConfigurationFile_Success) {
		// <WithConfigurationFile>
		// use Activate only once in your app
		Javonet::Activate(ActivationCredentials::yourLicenseKey);

		// set up variables
		std::string configFilePath = resourcesDirectory + "/channel-tests-config.json";
		auto communicationChannel = Javonet::WithConfig(configFilePath);
		// use communicationChannel to create runtimes to interact with
		// </WithConfigurationFile>
		EXPECT_NE(nullptr, communicationChannel);
	}
}
