class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1295.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "e9859ea04ee6ac45658a881dda598d4eb2c1dbac187f07ff47f00e7feacf6a63"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "b74397d926542991d2ddbed3731c71ce8e82770ce835dca18ec7b67e646fae0d"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "ab6347ccfff99c8c7ae57fda15573a1368d1c710612a9358d0ec98d15cc73677"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "60ee94e7c1d4fd4301d6e47bffc87bec6eeb370a12838ef9928a191e0f29f5ee"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
