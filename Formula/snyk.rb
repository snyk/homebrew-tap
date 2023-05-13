class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1155.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1155.0/snyk-macos"
    sha256 "de48571bb9f2abfe7d929b4ca5ba603b9f4d5989a27c4e8b36b498ec0f82f045"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1155.0/snyk-linux"
    sha256 "fb4902e39360a6b25584183e8d57a50d0be0d3fc7980e41afcda446d88758118"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
