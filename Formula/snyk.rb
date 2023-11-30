class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1258.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1258.0/snyk-macos"
    sha256 "4103928a75de31338a3aa461d2e9f0afe04eaa36e9786957ec99efc4c09d3ce3"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1258.0/snyk-macos-arm64"
    sha256 "0ec590c55ec104c14d8a8a72bc0ce30997596110fadc4399ef9e1fcad1d9a9c5"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1258.0/snyk-linux"
    sha256 "3938209ed1479316fdf541b22a648bd17168f0cdfb51cb2c31d4b3d254b74c5b"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1258.0/snyk-linux-arm64"
    sha256 "2bdcc4c51ab77008f3aecd27a7924a65805422e6b5858ddbf11ea5fa4d8ad937"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
