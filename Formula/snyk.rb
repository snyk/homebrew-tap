class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.738.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.738.0/snyk-macos"
    sha256 "8845fce366a501915adbf2e3b79900dad9878e07a8e6d1073b342a700fbbf704"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.738.0/snyk-linux"
    sha256 "4a279a620493af17902973da5a0b0d99e120b3db9dc4325f8ac7d868ebf9e1a3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
