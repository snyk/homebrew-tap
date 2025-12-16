class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1301.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1301.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "91fbc68362d6c922a17ed71ea4feed32c0cb2606b196eaf910d90068c382d7b6"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1301.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "ad66042d662b7f06ae0e422f07321496ea536c5085e479012a1c77b631b7113d"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1301.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "1b6a0cb853020c6ed57bb1d5fc5b4c08dd748b823068db300f3b399eed7c614e"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1301.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "84237cf016e7dff183a0d7a56f8e63370a90f7a3875ae9be9eede6f869f6a776"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
