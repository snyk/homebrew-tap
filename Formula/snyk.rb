class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.946.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.946.0/snyk-macos"
    sha256 "e93519e84aaec203cd23f62271fb6de9b9e5bdc36057bc5090ce7676c6db833b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.946.0/snyk-linux"
    sha256 "92a8fc5920cbaa67f406b7d44345693d2a88ee1bbc45ee0de92ddaa9db37f934"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
