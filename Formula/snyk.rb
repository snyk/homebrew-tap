class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1221.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1221.0/snyk-macos"
    sha256 "52ed1405bb88299d256287597260a793f1a80b6ef3df0857ba08836fd329670a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1221.0/snyk-linux"
    sha256 "006fe4a3eb09738dcfe095f8c8d1d2f0614c9e81342416fc34989104569d5bf3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
