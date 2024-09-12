class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1293.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1293.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "6c6754d06f191bcaa18302009217ad6f6412d415e00085f9209751b58117f0e5"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1293.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "527cbe1b28221599cd3209eab9a27bf65336d557e79c01f4caf0b96c5e31ef49"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1293.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "1112ac24ad64ff309c0a51254a4caa2c8246fd6f21246547d72474255eeec429"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1293.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "e3bb8264e4a95e96c553b80e76e0dfea2690f104e5a05ea309560f6e7bce9d1f"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
