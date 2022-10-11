class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1026.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1026.0/snyk-macos"
    sha256 "6d1f311d6a6763d5f39084059509a094f7c669180a4c31ef89ccabb98fe5b7f9"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1026.0/snyk-linux"
    sha256 "c377e0cfe2d9dae7a517416c6c9868f4ef29d9cd9fe71e12b5a7f3a5b330ae89"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
