class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.731.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.731.0/snyk-macos"
    sha256 "3c4406ead37996ac6893d8840c71eab0bcecd80add379358aaccb0ad4d7a7ab8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.731.0/snyk-linux"
    sha256 "9eaa275bb92889bb91d51b94567e61c51c693d404374e33eaba078360ee43cd5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
