class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1305.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1305.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "c2d2ba7063b865a1c08c7f4e7eadaf7bd3c458fc105ba537c446c347880d9085"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1305.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "da3dcdb811f604e28833ec29a9e2f4cf27ab08625736a885e042d42bfc2d66e5"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1305.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "62afc00458622ca01aaff0e6299d65a357c05dbf97490ca1f5462274d7655aba"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1305.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "08887d6bde73d179aec85f81545ed2265f89f75f6dfbd603bba6919cd25e3c16"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
