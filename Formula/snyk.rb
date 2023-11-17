class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1248.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1248.0/snyk-macos"
    sha256 "3a9ae8d8684b36ec459b466477fb66dc92983bf89efa057ab50beee0d272cd31"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1248.0/snyk-macos-arm64"
    sha256 "335314b6cf2e2e10e1692842c237d9a88c91040d095e2e4f33451ed3500c8ece"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1248.0/snyk-linux"
    sha256 "9dba53c764d7fc75368f08824e6c320d8741a7ff326dcc2db88c62451f282a8d"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1248.0/snyk-linux-arm64"
    sha256 "24f3ed8f73f52d390fd9943ca8288183939778eda9d86e45d72eb4a7e4608cdf"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
