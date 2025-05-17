class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1297.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1297.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "abdac2319379d038506abded61ff1f4530c3b860d4b9e686e35aca0c12d7da09"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1297.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "5d679b8ff42b0bd4d60d7b3c2ce900254066e0a0fcff8a306e6116563b4d575a"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1297.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "f7c1ea2c28479136cc0ae6134a2c87bc2493473af6c3766e400fb04c01f2e3fe"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1297.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "c802462732d6dee140ed02a007d9bd98fc26fe9733fa69fd45af982d550ac24e"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
