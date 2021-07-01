class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.652.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.652.0/snyk-macos"
    sha256 "35df0b3a3574cca784d2dec2ff1f9532d16d038bd7b2ca4c6020883fa7937dd9"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.652.0/snyk-linux"
    sha256 "1a6d3fca89263aeecf495a364225f79d772fe588bb94a55cefd813ca27df4dba"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
