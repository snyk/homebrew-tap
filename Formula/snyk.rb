class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1297.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1297.3/snyk-macos?utm_source=HOMEBREW"
    sha256 "6ed3ec00f5df6cc9415448e2e01a517f3af7969e93a3e4e09de66d623cb3ef46"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1297.3/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "968098ac465a80c5bbb723b4b961b02f090d6ff98882c992268cc737c5812f85"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1297.3/snyk-linux?utm_source=HOMEBREW"
    sha256 "3dbb4d4a92ab2e27630e2fcd1abb5f52a2332eba098fda0c8f35164e45ce87c9"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1297.3/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "80f2cce57fe619c4e6c212cb75c0b905290408f682dc3ee27584871758e0be75"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
