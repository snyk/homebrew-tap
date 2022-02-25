class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.858.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.858.0/snyk-macos"
    sha256 "10b8acbfeb80b172f6ab0b5be5503c31a7efed597f7f308228195c9655afaa03"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.858.0/snyk-linux"
    sha256 "a4a806ee4fcfd603bd78893355c674cc5e841efb87b5641446b7072c8c5a83e7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
