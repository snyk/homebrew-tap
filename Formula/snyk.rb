class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.298.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.298.1/snyk-macos"
    sha256 "4da920c5ffd63932bc97aa668cbebfdc91fec4ecc6d31c28cac8941e205f3358"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.298.1/snyk-linux"
    sha256 "3f97c08f834b51c2d1c598efcebd1e47f75203dea3853074393b5e813e78b66d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
