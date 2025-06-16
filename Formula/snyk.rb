class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1297.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1297.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "23db387e4e284fa640db166acca6c4a5ebbd502dfb5631c1c6e1b6409dd7fbc9"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1297.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "b30798ee892084d33bcaeeab45093b3eacf37a2d9b92d534940891794b2dad14"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1297.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "7e45e67a133c48ad31e58c8ac7ea96c0aab1bd1b5c5be49454a946f99306b885"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1297.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "1a9ec7710e55a5c70f3e0dd21c61a91e245172bf5072d7f2546197053cb53f3c"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
