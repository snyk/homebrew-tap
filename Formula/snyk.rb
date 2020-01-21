class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.279.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.279.0/snyk-macos"
    sha256 "7266ca014d74542871b0143c41c12fdee3d8fdf550385fd371e98663b6b495a8"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.279.0/snyk-linux"
    sha256 "3f48a10e1a7f9044d0b1a7d1ea82bda1b15ea509c2dfd5f09625d2c3a45100fb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
