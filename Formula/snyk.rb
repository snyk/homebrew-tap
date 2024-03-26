class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1286.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1286.0/snyk-macos"
    sha256 "6db8f0db905ae06b97951099cfcbb3f7c2da945fe3fbbb69455961a44358c9c0"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1286.0/snyk-macos-arm64"
    sha256 "cae6eced09a2961e74457b0ad5c0c1cf9e97812e3aa1a6c84e14939b3726231a"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1286.0/snyk-linux"
    sha256 "d443857b7763825a74b57577c5c078609e57d390509bc840e9178abe0b910c87"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1286.0/snyk-linux-arm64"
    sha256 "2ff4f7331c5a0dbde2e8434de3bb3e056173368c7658c6d7a4cd77c9ecbda5cb"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
