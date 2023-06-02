class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1173.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1173.0/snyk-macos"
    sha256 "c5841e4fd5bce1b0867b1e2c50ffa91ff70f361f0a199551fca9230d880f00f8"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1173.0/snyk-linux"
    sha256 "a009942888bda0f8105b632d226a712803b81bcd66cb9b3b64c5fdc2e210979f"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
