class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1300.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1300.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "c86520c14c9d4f1a3c198ed1292d28a1359285c4645c6e7a3dced77f7c363bf1"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1300.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "5b97351f54971dd1f8697dbadb8e568937c0055b9481320758a334f5f413fed1"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1300.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "b29eac410959167cd1ad83e6b4e47de6d1b3a49619a7ed6c0104282f87268a4a"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1300.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "77764a8bff1efaf9322ee98edeb7af474956299ca4ea45a847cb17618dd8d283"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
