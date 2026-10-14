class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1308.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "af50f5f69c39c38948d276cb496f786876ea14b647876780365b3f1171765876"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "cc0fc309e6f1c8dd3db4b9b35bf1d524ac94eb04aeebf926b7666ace49bdaaa5"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "a8b2e420af6d8e61bf1d367c064475ccf699d767fc8763efb0072b9cac250f9a"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "bc80903433d94036698ac695d67e3fbbf49cae318adda970c3db23e95cd22d56"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
