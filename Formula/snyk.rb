class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.812.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.812.0/snyk-macos"
    sha256 "1845149eb2f4adb62f8417b8965490ca7558e72a099e758e8a21950cac759347"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.812.0/snyk-linux"
    sha256 "cbc8e0e6883d5b0839a14c25f81ac1c9d71f2144b48009627c4b48dd5e070b8f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
