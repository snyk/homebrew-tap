class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1305.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1305.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "3d192da778bd911eeaa8573b0c0369bce1edacb1570198bab433ff3d467bede2"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1305.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "8357ef75f73fc46ddda730e5f862026624363f91c29b1eb09588f21619c54bc2"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1305.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "60e7cb5538a8cf024344cde041a1aa2bf8bc0e54a59c041a4114ec84a7e966ed"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1305.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "3288cae60114c7b49e0ee9ae68f0d538a743c5a15cff29f9fb42c3015cad98e8"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
