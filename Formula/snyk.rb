class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.728.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.728.0/snyk-macos"
    sha256 "fa788b0f40fbc6902bccfeee75b28a94fca4f7c2c0e58d99867822e60def4180"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.728.0/snyk-linux"
    sha256 "bdcf77b4435b583d2e6b34c497040e23a942f3e1afe0b8f71910780613524b17"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
