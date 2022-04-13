class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.904.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.904.0/snyk-macos"
    sha256 "207834ab93716b643bc42f638e690a168346f7c0d20a0666dfc1b9d4228bfb01"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.904.0/snyk-linux"
    sha256 "8c19d7b416a405b7bfa32ce0689a8468af181df7ca935f2b884bd61328a48498"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
