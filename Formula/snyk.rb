class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.389.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.389.0/snyk-macos"
    sha256 "0b588f87dea9900ba6e3a8b71e824bfc702250b150ef44de452e236bbf097e70"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.389.0/snyk-linux"
    sha256 "8a9d5ca7229b2875452d2ce6522accfc90331021721f0899368bcdf6f4b86998"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
