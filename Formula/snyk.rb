class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1302.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1302.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "061457625a47c0b486cf13958791db62ad852276a3dd5015f10ae2623339c087"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1302.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "99b1a180be308517e37cc7942f0c6c6a5489c92c8f3b891db7c02e25d9ecb47d"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1302.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "38dd8f651ee5b9d022a710154d9e56a325fcbe9824894e3c836a5b78fbf82b49"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1302.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "d1e862bcc861af664ef3152267de2299a4a558cfefc18f42c4c2659fb4fd9884"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
