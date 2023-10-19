class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1236.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1236.0/snyk-macos"
    sha256 "4c6524f5b60a8dd10c334a82a4d4effa7d7cb0557f7dd0301a43172667451e25"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1236.0/snyk-macos-arm64"
    sha256 "8a79fc49504fa98272446362be3c1966d1ee40810eb2b1feebfc9e06ac90c090"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1236.0/snyk-linux"
    sha256 "4d40e810ec1b8cb4fda4d1025adfa12d629f84b3621cd3adf640f70b307670ce"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1236.0/snyk-linux-arm64"
    sha256 "f3a536b7ca14629012c36c5283db34fe78b931516aadfd36f807744f50e4fabb"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
