class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1295.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "b9dab3c7cd3c577582b7025f07828c365bfccbe238013f12d1677c089c3498cf"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "f17f1d542f370fe819e0b3ecc5789d86eec5b19629b8eec20414ba19d50a2a7d"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "ee7382115d7a4f1fee05a70e3af7db4dbd07f6c54f1adb76fce534ac607c0372"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "4fe896143b48cd2eba78821dc6a28570b7817c21d8e747a52340cabd63fd5380"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
