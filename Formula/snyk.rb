class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.816.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.816.0/snyk-macos"
    sha256 "9a7365bd32d7f6cab473608cc798423dffeaac7d7165ca1d964f7062a37f16a0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.816.0/snyk-linux"
    sha256 "41451f63769d70c59b3ac3a8e7c55a5ab75b05cbf1b519369727eae4762ad5ef"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
