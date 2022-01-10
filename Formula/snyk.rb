class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.820.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.820.0/snyk-macos"
    sha256 "359565259bc277debe8f770868469b8654ed4ea612dd9a9fbb109341fd803c3e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.820.0/snyk-linux"
    sha256 "a74b2fc222ae5ef695d595f0d200f43eb0eecca49cbb96b0c1b136ef3358d1c5"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
