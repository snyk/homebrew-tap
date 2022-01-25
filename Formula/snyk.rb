class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.836.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.836.0/snyk-macos"
    sha256 "9ec926bcd663491d602abb5694df9ecaf45047cabe70de0a0d507a6699bea013"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.836.0/snyk-linux"
    sha256 "2770c0bb8e4b9083e1edab6ad33173dfe37c01b03bbd2104ec416b1952f4c432"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
