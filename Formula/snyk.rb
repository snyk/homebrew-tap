class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.339.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.339.2/snyk-macos"
    sha256 "0dbe894cd817278e1fea0ba3ab094783a1696c333c823c0d3dc3129dc0b52b2f"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.339.2/snyk-linux"
    sha256 "f0f8c2682240a1abea55b0524a7bb4e603472f52cdab6ffb491b7ffec888b6b6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
