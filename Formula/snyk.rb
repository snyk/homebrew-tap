class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1246.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1246.0/snyk-macos"
    sha256 "0c463b25d798e62ec4cd44ab11459407d23df925da26baf9fd1b5f96744e84c6"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1246.0/snyk-macos-arm64"
    sha256 "ac4600b2417534e819d9518c767f50a55d447b282d2f93e773546fba16af20e4"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1246.0/snyk-linux"
    sha256 "cd3bbdd2332000265e904ae3b373a8f25e0e553e419319f67ff87fe23ab4f9ae"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1246.0/snyk-linux-arm64"
    sha256 "97d1ba0a26aace4e6dc1b798a8eb1f9921fd20c963d53c6cac8112a3d349c1fe"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
