class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1294.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1294.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "fafcaf66c6411dbbd12ee368df0f62dbfeb3e475c6fe9ae496964b26298aeb42"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1294.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "491e1de03e58a3ce27d026c214feb00cb4340c338ca310f631d789016986024e"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1294.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "ac0b4d4f72050a44c143b99015b9550a75999fe88d7fd5bee027fd7c1fda0fbe"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1294.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "a3ad8d0f121032bcdde0048bcd73a719beacadccfa626b752bb287e5eaeefbbf"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
