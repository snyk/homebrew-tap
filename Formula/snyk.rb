class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1203.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1203.0/snyk-macos"
    sha256 "280bf03611afc1b82f11afa0e79eac0100d539e6c4cb23c973615ada7a36e71f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1203.0/snyk-linux"
    sha256 "75323374e7c365103588395dde39dcaa0b4973f6e079727812a04e89b2ad0add"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
