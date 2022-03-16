class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.872.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.872.0/snyk-macos"
    sha256 "bea99c3a2d4f01d837ec8757685dd5eea0845b2eb8347432fa2f93aaa4fdcc94"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.872.0/snyk-linux"
    sha256 "6a6010ba2b61ae72411f3377c8914afbda1e5623b6d93c8f29621f488c16ad73"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
