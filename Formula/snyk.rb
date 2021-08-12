class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.679.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.679.0/snyk-macos"
    sha256 "12e12dfb06eac6262083560f927366dfc3b5566ea04b9ae9aba47ff88b5bd3c7"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.679.0/snyk-linux"
    sha256 "7e537cb0fdaef3b14e4fdf19dfab718c46ae0269041707659ff7612ca2f10a68"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
