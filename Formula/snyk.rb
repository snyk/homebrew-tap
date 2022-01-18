class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.831.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.831.0/snyk-macos"
    sha256 "23d36056c77448bfdbdcc408aa32cd2a3bee35fbd404ccf58a66201d667789b3"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.831.0/snyk-linux"
    sha256 "97f460ddea08aa8b775ce80ce06bb561113efccd92c46c0e152c396fd8d970da"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
