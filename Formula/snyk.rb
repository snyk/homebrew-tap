class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.660.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.660.0/snyk-macos"
    sha256 "050cc5b558de580516fd98705d9be8e945fdd50c64a2940e9f043402adb6d5a0"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.660.0/snyk-linux"
    sha256 "9d13c4c40f81654af459c41ab67bcd4e18a8610145b1b444c5d777d502ae6f57"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
