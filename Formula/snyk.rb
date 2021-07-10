class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.658.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.658.0/snyk-macos"
    sha256 "a620b51ecfbd5919ffc01a7b948bdce7c32044f09122665f2aedfffe2215d2b1"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.658.0/snyk-linux"
    sha256 "d50d07cfe354c9deff339ec5b3552ecea315fd2c1eb0f0552bc2d50664722b5b"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
