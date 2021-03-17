class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.491.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.491.0/snyk-macos"
    sha256 "3b10430ef7a867e1f98985afafd83f75a867bc0c027dd1ee092651c0cb3ec8d4"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.491.0/snyk-linux"
    sha256 "a2e8e1bc68c7c12340590be5f5ea84d445b1a09a51a895b16d921f3f0b4140dd"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
