class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1274.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1274.0/snyk-macos"
    sha256 "fe7817fc9a3d00f44225af67a0cff3211a446c39db12e388d4f4494b956e2d2c"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1274.0/snyk-macos-arm64"
    sha256 "5f716e1ba8537fc6e7aacd5392c0e83d6ebba1697303362b02b12c95bec67b28"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1274.0/snyk-linux"
    sha256 "2e05b9393a26280cf95e82780c111e21d848f5fe2cbcf7faaafb90b02b73ff17"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1274.0/snyk-linux-arm64"
    sha256 "9913fc0bbae1d361bf627ab5b0f64c487113d7961334860d3526269923e89f15"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
