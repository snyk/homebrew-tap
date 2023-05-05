class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1152.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1152.0/snyk-macos"
    sha256 "8ad367d59f90df7f30980fffa9769fae4a02f7f1178b62e51a0faa8943e99942"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1152.0/snyk-linux"
    sha256 "7353df09bcf73c91f0131f9f92f84bbc4354aecc1dcc48ca871e16d3557906d8"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
