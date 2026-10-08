class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1308.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "4c2d46bfacbe034e6b9f13f5226731e8bd22ffbf08e46b435de65889e4eae1a1"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "6439fd2ab633444ecb3e646da5e8539a28ccc8787455f7b9453529a5e7406e04"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "a916d3ec9e6c27d56cf67664459885512758a1ae94418ba430fcb92e86c32ae1"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "059d33ea4fa3d53c26ade2b6f69ab61dcf567dc8cbc2225ef3060db6fcfe8664"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
