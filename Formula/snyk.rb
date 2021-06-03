class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.621.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.621.0/snyk-macos"
    sha256 "a2ebf0603a982258687eb4d7f3c037d15f96c3786dc3ef8c77c05df9865c5350"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.621.0/snyk-linux"
    sha256 "e2f1f8d8353f6596303e355684ee5f82115a200883992b6ea1d757716f9d35e0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
