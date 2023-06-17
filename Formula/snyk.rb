class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1182.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1182.0/snyk-macos"
    sha256 "f43c3751f25965b285e4e9654524cec47640e3ba9eafd4654d8cc5d8493b85c8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1182.0/snyk-linux"
    sha256 "c4cfdef4fd0436efcd825de25faa56a2c0728d7c9bc28104658a0b95db1f3fa3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
