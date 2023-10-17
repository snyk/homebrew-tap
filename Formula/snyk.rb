class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1235.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1235.0/snyk-macos"
    sha256 "2b767aa72389701b13f8e0df025cbcdff761cb4c0511d496977d4be987b1f353"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1235.0/snyk-macos-arm64"
    sha256 "f795f70c116b632e1fc62502110cdb75de5a814f779928929c6b7e7159818a7c"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1235.0/snyk-linux"
    sha256 "704b667a00f2519ebb15d3498060faab5964088e9e3c105dbd948a9cf0260cc8"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1235.0/snyk-linux-arm64"
    sha256 "9c80be1b8dadbff2e0dce1736ee528ad232884d9ea6550eba2f18fbe71f40db0"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
