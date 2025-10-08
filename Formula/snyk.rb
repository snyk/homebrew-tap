class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1300.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1300.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "5162cd936d30a24d2f4c80024aebf5ffd1fa41e22d90e54aba53adb70e77e31c"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1300.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "bf9de4415ce7a848b0d1c6ceef8a83b3d0c74cabc84f55f0463add1b07263b87"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1300.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "5e22aa63748854a81ab4cc4515b1b9552c167c2efa22e3e956ba99327ba4cde6"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1300.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "9d6d0fd9c422df3f7628c969e1701d482dd1d72a61aeb176e5b3e8f6d8bfa6a2"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
