class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1184.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1184.0/snyk-macos"
    sha256 "3f28abcbca37248068831c75c6fc3ca5a9f8d3b090b9834a3fb082286afaa95a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1184.0/snyk-linux"
    sha256 "09e18cbdd187269150478703dcd15944858d09bcc5aaab0e5b3972cfa4f915a5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
