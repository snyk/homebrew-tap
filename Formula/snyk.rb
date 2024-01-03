class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1267.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1267.0/snyk-macos"
    sha256 "6be857e7236156143f034d625760356449f6a50b026797a196a95f0247548b35"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1267.0/snyk-macos-arm64"
    sha256 "4735108ad720dd71ade4ec55bbbda1df799c43095b4d5b691da18903c82fe1f0"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1267.0/snyk-linux"
    sha256 "26592a847d1f774e9a98386bddd36fdef00d853c61c98062118b8d7436c502e2"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1267.0/snyk-linux-arm64"
    sha256 "cf936257ce1ddcff3c67bd54fd2377681c7f94775ce24dc321039065b3ba6f15"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
