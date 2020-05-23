class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.324.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.324.0/snyk-macos"
    sha256 "0b049eb0b13e19c22a4773fe424ca526765212d6299d150effde85b8220e3d5c"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.324.0/snyk-linux"
    sha256 "f54c7630a7033a40754de924751a545888b681ff8c6c4e34069c96099fbbbafa"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
