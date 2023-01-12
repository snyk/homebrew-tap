class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1085.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1085.0/snyk-macos"
    sha256 "b360aea3199dfb761a781c31dfc61f24ab21d272ae6cebc0b8e0ff914a0b71ad"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1085.0/snyk-linux"
    sha256 "8a9276b25bfe8d29619c4eef3c71ce59c3c1c67b1df930521809c85251603ff2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
