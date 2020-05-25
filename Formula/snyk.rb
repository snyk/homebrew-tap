class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.327.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.327.0/snyk-macos"
    sha256 "385951192b19008da89ce7eefb109a192a9ca07135f7e3ec21245d8aa0648e12"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.327.0/snyk-linux"
    sha256 "e7a84b6a9ca6ab8a1f656fc4bd3a7bfd7cfc4d440b056a4b5f82daff6f12ab98"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
