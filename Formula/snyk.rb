class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.466.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.466.0/snyk-macos"
    sha256 "262589bf1e089459e04e88e3cd79345804ad25bd8f12af3e3cea716dcbe8264f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.466.0/snyk-linux"
    sha256 "543535fcea9c5ae8b43359b0931afdb97923b40dd3ec4918db877c94a8056226"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
