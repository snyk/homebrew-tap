class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.896.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.896.0/snyk-macos"
    sha256 "54f73024392100887e1e224daed61fa482d1c359815d0066b01772fc7fe16f67"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.896.0/snyk-linux"
    sha256 "578df990ea04f561754a52373e2313624857be899c40712aee03d93e523a2959"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
