class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.294.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.294.0/snyk-macos"
    sha256 "bb7f625ec5643cfd5505d29539d997beac363284749d50a1600fb2cda381c62f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.294.0/snyk-linux"
    sha256 "edb2926e4df6ca8e9771437ae2192d2e466b3f91da743a0a45773dafa48e6ced"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
