class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.543.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.543.0/snyk-macos"
    sha256 "8d9032568c57fff8ffa7e8af774a77364505d622e183cf03fade35bbf9b2719b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.543.0/snyk-linux"
    sha256 "b62c6d7e5997cd0363eae1fc0dce8100d26c717fc3865bc6eb4df5aa8abe98aa"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
