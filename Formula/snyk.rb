class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1074.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1074.0/snyk-macos"
    sha256 "25bc63a7d698c3586e37e73033bf9ceac0d4242ef4e83627d4d46cfb08fdefc1"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1074.0/snyk-linux"
    sha256 "bbd5353012fd53f4e1a2de643b3476972aeafe9e29d4939c198c1939cbc5d26a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
