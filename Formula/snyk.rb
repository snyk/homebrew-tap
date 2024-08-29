class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1293.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1293.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "5a5212f33c87640280e3cf749dfc8b966f4c126251a8f4921887b5cdb40fb78e"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1293.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "c3ff853e7d56f4a52fa287071feab476902c5efd3c095c6954aa683e2b005f1e"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1293.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "3b94c1bf5b47adc065707ebfcd446457459f72f0aa6734b067597c5679bcdd2f"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1293.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "6b9457c0cf01e05ecf803b48cb0186cd7f267b016b616482b7f06e95d9eb28b7"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
