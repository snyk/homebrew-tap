class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.335.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.335.0/snyk-macos"
    sha256 "0895b67b9567340c6783198fc9ea3e06b7082b1980601761b5d893644de04fcf"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.335.0/snyk-linux"
    sha256 "57b83cae182ccb0c404fc04418f1d07a2e708ccd310d8a6394f78b47b9bfa57b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
