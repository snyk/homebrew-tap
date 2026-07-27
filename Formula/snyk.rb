class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1306.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "b4f9a94ffbe07b632351a638949d59d46838a5b822a4e8bfa1c4e0e70c3697ba"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "063c8667dbd58bdb345fe6e9d4bcaf37512d6a367b905c3b85df558a2c196e55"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "948ecc90d929f203a707e8f94478b8b9b64a4bbfc5cfb60916ba830ac91cfcd8"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "9e14f3c6777aac2dec493b5a09796bc791161014f51b284cefb8fc399b9e2fc9"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
