class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1199.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1199.0/snyk-macos"
    sha256 "e43328d0852d796372d4f5ba82aef9b50f645e341eed272505838dc9109195a7"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1199.0/snyk-linux"
    sha256 "0130216cfb28652bbc7d6577ca1db46eb217e360570f3731486244f1670efdc7"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
