class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1168.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1168.0/snyk-macos"
    sha256 "a41f00c796735234a021d0454bba5c25f297012d1e8c907ad1289284c338a450"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1168.0/snyk-linux"
    sha256 "ce9f390ca7880301a5edc24c018f2ec67a72a28bae7c5f905c34e9fa910df885"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
