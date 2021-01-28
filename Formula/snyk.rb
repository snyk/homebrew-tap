class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.439.3"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.439.3/snyk-macos"
    sha256 "827026c1a834c269389e9b2bce155682ef02a323e1001a0aafe584e029465ed1"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.439.3/snyk-linux"
    sha256 "c2200ff54e15a32a740575b0a385b941f311c31ac59141e84b8639acea531889"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
