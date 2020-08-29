class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.386.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.386.0/snyk-macos"
    sha256 "f39099e90a9b550a5bac6f6b207cc2a12779f6cac923ccec6ffbeec66eb8bb33"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.386.0/snyk-linux"
    sha256 "e88bccc54ec2c3d2929b92b9ce4ed65bb23bd4596420a669554fb1e0e3ce1b48"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
