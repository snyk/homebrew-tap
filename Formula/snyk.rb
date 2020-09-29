class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.402.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.402.0/snyk-macos"
    sha256 "82e55d2d072e489b38dd21cf624bbead717fead5d0f692d08b8831af73aa4d5a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.402.0/snyk-linux"
    sha256 "7c0ff0aff1ab1cc495ec4841bb2ab0d2ccd43c4250b14d6ae378f1f2d087e46d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
