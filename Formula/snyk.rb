class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.378.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.378.0/snyk-macos"
    sha256 "52e3d05e526aff38f9fa91e02e00cae8a318a73ce0a736ed4c7b2f2a7c407709"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.378.0/snyk-linux"
    sha256 "ea44a3fab6ecbe951da66ca10e90fff60999d2a5e46a645f9fef25d583cbda1a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
