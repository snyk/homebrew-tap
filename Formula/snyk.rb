class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1306.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "6cc098b4764d55d741f71c26dea3f40dbda58465955a2814abba2e99d2dafe2e"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "3e770af114b269be3c112d42dbf4b28ca63f887bfc5a4d24057f6b12e54ffa4c"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "aad6d43f936e4357b3bda299c02d446c80602106484c36615bb4b654ef7de740"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "768f0d925f3646cdd17f5caa14e9c8153c9059ea24136c67635f9b6368fac02f"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
