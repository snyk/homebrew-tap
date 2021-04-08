class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.528.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.528.0/snyk-macos"
    sha256 "3a86a7c7be7c5d62ad88a5f6397cd57ad15e010f51458bc75763a7402b3ddbc7"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.528.0/snyk-linux"
    sha256 "eb98b752853c7e8bb5498ba4dc0f7244f30fd86faef047f8bd82ce74ef615342"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
