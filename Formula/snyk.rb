class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1307.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "4c5e6e2e3c566b3da96672591ed3dc15680eda12685eb830bc97d4b8c000408b"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "fa2748dc6ecebaddcba2f8c2dda19895551b5c8a5504ba24aabb61e1dd679396"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "5543aca8a959e529eda253808c9dad9ea8a85ce9bcf540bf681637794b1fbed6"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "b69da62bd5a036e688c6e1ff579fea7e1050a8d47d9249ab62f9a75a6dd0047a"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
