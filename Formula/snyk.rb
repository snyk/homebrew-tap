class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1192.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1192.0/snyk-macos"
    sha256 "78629310165e6dc299de64b5abd548f95b77b9d3b4500e3677cfcbe85b1e7f3c"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1192.0/snyk-linux"
    sha256 "1b379d5f9094ae868600b4a68fc2c91d0f52ef6fe42ea92ab23c07314b81cf86"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
