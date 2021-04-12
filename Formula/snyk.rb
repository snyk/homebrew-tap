class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.531.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.531.0/snyk-macos"
    sha256 "59c42c80f6d414a15e620140ba28174d7748c59f3c7e527599a59cc60d31a930"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.531.0/snyk-linux"
    sha256 "96fcd0b28d3560d79d1b3694a27aaca96b06c89ac1eb8112e6a3845be8200134"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
