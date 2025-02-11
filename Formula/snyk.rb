class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1295.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.3/snyk-macos?utm_source=HOMEBREW"
    sha256 "442afd12abc3fb7542410f2a9c6508cb1030f6cec4dd5aa6d74fafd763d660ee"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.3/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "cff3acf3799e020e78ee0819501f1f9d6bdb4ee1873127ba81401dd4f5d876ac"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1295.3/snyk-linux?utm_source=HOMEBREW"
    sha256 "2ea43c4856a7795a651158bcc168b323f4d85801d195ac21f5e5bd3c6bd39270"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1295.3/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "6bbe90b5a6f9ec32d4733f9bc591c6794f557dff2834cc9b18a89651a22c9684"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
