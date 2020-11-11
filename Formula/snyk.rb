class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.425.2"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.425.2/snyk-macos"
    sha256 "d13d2e2036bf320989605b2e8835e57dcadf11f89f3c226576fc72223c1de890"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.425.2/snyk-linux"
    sha256 "5998468321574ec419765ec2b10068d00a4e71934d48f5d3e9b0de854dc18b65"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
