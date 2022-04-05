class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.894.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.894.0/snyk-macos"
    sha256 "57ca0beaaeb13a83a1b19e3d7f33c77eb042202424b00ccc227560c6758e0dc8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.894.0/snyk-linux"
    sha256 "ea6d85605361ce16050eaf5b98d74e62b0e3677e1d03f275af92d6bdc2279cf3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
