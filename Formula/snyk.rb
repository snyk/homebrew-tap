class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.421.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.421.0/snyk-macos"
    sha256 "0fc5024dbab3b5cc09c663556a8a1334928ff8e1ce0030e933eaa79c0bb6034d"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.421.0/snyk-linux"
    sha256 "d31394eee2f85a38c035b80a82b71e31f335f7ece82d01bceb02d9323f20d903"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
