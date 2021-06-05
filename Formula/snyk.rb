class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.622.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.622.0/snyk-macos"
    sha256 "298413922c64cc66eeed166c2dc2d52a21d2aa2b3db83e0fee21d35bc1c4527b"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.622.0/snyk-linux"
    sha256 "b9d6988ec4954dbae5f901290fd19360560f32aec2dfab0dd4006d821fedfc93"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
