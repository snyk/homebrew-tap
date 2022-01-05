class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.817.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.817.0/snyk-macos"
    sha256 "3dc3fe62d303aa0dd95c0ef3eeb278ed184ff061836af8bec66b95aaa0ec3640"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.817.0/snyk-linux"
    sha256 "0023481267d3f8b554795056aa75158b03b863e3b9c8ed90f9c4f19dcdf826e2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
