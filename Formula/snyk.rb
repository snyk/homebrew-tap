class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1294.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1294.3/snyk-macos?utm_source=HOMEBREW"
    sha256 "ee15fc0d27c1a1b6439bf40595876cdde89d2ed615c935b9081ea7d2962db16c"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1294.3/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "bda9b115ba6331e014bfa6d4cbd4574ef69f0047b3c4b1db27bfb70bfe2a1cfe"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1294.3/snyk-linux?utm_source=HOMEBREW"
    sha256 "cfb789e412a29c895472eabbd3dce3c8e72b6286691c1e42e80b0a01c7db064f"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1294.3/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "dfc05303098b0e1b78ca9ae62022d2f50bf532d94658cb9e70ed5b8fc7ee4a88"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
