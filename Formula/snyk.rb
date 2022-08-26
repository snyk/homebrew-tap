class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.992.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.992.0/snyk-macos"
    sha256 "d3e15eee8873402b4b17ecd0bbf5b2caafce5360c8a655ba1106f4bd37c3d80f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.992.0/snyk-linux"
    sha256 "5ab67f47b2d879cedfe1a54631d7105d28e556d08cd6198ccedd46d201a0616b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
