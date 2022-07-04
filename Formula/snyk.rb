class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.962.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.962.0/snyk-macos"
    sha256 "e02e56a9002dd3f4425cdae4989f29ce2cf7833e261b323a94ef1bce462d4ec0"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.962.0/snyk-linux"
    sha256 "81636cd9d34cad7e85e21520c74d4ddb42d162b11635ebb1112c9ac057a27aad"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
