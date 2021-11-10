class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.759.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.759.0/snyk-macos"
    sha256 "f6ee94059dad51e90118d6cd55e1bba699a5767b5741b500b7469252d445106f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.759.0/snyk-linux"
    sha256 "c5c732b4e68a93b44a632a1b7ac7556af005f82d07077c29df092e07c5a22ce2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
