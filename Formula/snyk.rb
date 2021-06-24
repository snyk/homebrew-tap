class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.643.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.643.0/snyk-macos"
    sha256 "4db30308ba8586db10eaf00cce1ab4341727689964e06d68b4077254fdc190f2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.643.0/snyk-linux"
    sha256 "bcfecaa2841aa795c3489836223f8c14e81cf2369313e62415ba5429a67788f2"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
