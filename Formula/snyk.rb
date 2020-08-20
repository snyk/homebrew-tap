class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.380.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.380.0/snyk-macos"
    sha256 "7535c9ac12fa49befbbc363578b169e03483175c037d0e007458d77d34aa8b46"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.380.0/snyk-linux"
    sha256 "0ba2ad7bb2ae2505f2c3ccd20e0546c16aedcdfb2e06239aa4d17a5242c8add1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
