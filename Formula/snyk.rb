class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.445.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.445.0/snyk-macos"
    sha256 "33d4e16af046d77d511888a00e3a4d204e1bf7e7ca2ae9c6e473060a239123a6"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.445.0/snyk-linux"
    sha256 "f2256cc005e05b9b6f15a4b5bf8fdd9bb8b8b4922eefb6535532e853d91e361a"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
