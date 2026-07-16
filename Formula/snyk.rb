class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1306.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "4f185089608e0ced67b919301806a2f2704923cc864d0830807313fb83789697"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "f11a81904b95e444e6bbfa6ac6d2be4108156e8eebad99022e10a17d9bab0661"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "3b25e6067e3d2f63a25213b44ca8f0eccc43133c76b9eb188155f80aa451f506"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "185832ce297f5a309af4ebb1a47dec9399f236f0d7b457c66926a3beb616555f"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
