class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1296.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1296.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "5bf15a2d9650a7aa5898dd5f695fe41ec0d114299bef18577bdad1713decc9aa"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1296.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "ea337fe5c23d865ffc06d4092dda56c9d25d71687d5fb051d03a7559ccb80e35"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1296.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "fb03583ffc0ae0c5dc8621a91764d840967fbbfc21b66956089107693f878982"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1296.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "18b82a90742ad75d22c75c8674363d2abe26a2c1e272a10fb146e09829828e0b"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
