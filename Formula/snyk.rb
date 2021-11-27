class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.775.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.775.0/snyk-macos"
    sha256 "1538726f358351b1362579256dd97147d9af969a2dbe3e388f0288dc9a491f4f"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.775.0/snyk-linux"
    sha256 "12a8935b85c8e59ff91b9b937adb2a0ed9d6558f2c0cfc99b57eac69683a5de6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
