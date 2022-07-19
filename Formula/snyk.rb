class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.974.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.974.0/snyk-macos"
    sha256 "9dec8578959e3bd94c9c29daa51f662aa702757422a77952c3a970b1ab66eaee"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.974.0/snyk-linux"
    sha256 "0e3a8b2b0157eef2468b2e6c3e78e40cc7268d70389e31ca3a4170c73d44b0f1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
