class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1250.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1250.0/snyk-macos"
    sha256 "6e3ea47aa502c7692b273a14f14299fd21d7b37f32c4192c1c9dd92ec1a075ab"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1250.0/snyk-macos-arm64"
    sha256 "bd8d3ae1806e4fbe8302bb60b0ed517be52ab58779da2f806e680fa10fe63601"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1250.0/snyk-linux"
    sha256 "95837b60eb845e8c2b13efd89e95ff9f90038501c674eab4deb9e0cdc4cbe50f"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1250.0/snyk-linux-arm64"
    sha256 "aaea0eff6375de1d19e74d4a00d721981238851a59d4d0ef547b7bd773aa4bb0"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
