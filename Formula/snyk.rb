class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1144.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1144.0/snyk-macos"
    sha256 "bb70d632d510bdc6f3842530fadac7accab688266393cd879ce0567d4c52aacd"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1144.0/snyk-linux"
    sha256 "a6d2f262ab3918a09d8fc8c17d0af2738d98bc2adaffba29156779f897b7411e"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
