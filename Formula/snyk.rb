class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.424.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.424.2/snyk-macos"
    sha256 "6098ae1396507d3849f600794d1026fefbcd1d37384b8ae83dc2adb25b8756b5"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.424.2/snyk-linux"
    sha256 "98aab31d71a8e1599fd69e4df4f48ac35ba2793008d5f96622495df69a3cf801"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
