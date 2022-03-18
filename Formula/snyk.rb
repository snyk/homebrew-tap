class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.875.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.875.0/snyk-macos"
    sha256 "8f375da7d384c705254bcd4ac07c7299ba46ba1ddb3b6d911f765035e28b2bf9"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.875.0/snyk-linux"
    sha256 "885c2ad10c2dde60026431ee1f37814dd9df14c5fe3c11fc36df238e21968602"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
