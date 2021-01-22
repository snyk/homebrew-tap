class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.439.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.439.0/snyk-macos"
    sha256 "412aae154f3390b132ac7646f570c4d96c49436789948fd553d316de219216fb"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.439.0/snyk-linux"
    sha256 "c0243c3d8677c8b4531b1e923590c2d678b80724002a3bcc80cca03ee509cfc5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
