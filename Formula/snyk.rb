class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1283.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1283.0/snyk-macos"
    sha256 "32797f7250afa598ff3a4a7ac7259891b7ce6224a1377afd927dd50640321e00"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1283.0/snyk-macos-arm64"
    sha256 "83d3dcdf4512e88eed6db5dad1682d9726933bda8f7be3e5e132da7c7dd990ae"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1283.0/snyk-linux"
    sha256 "a499683208e32b82a1ef0ed27fcd043908a4cefc5b9f1c96c564bcf6c90e6690"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1283.0/snyk-linux-arm64"
    sha256 "dcd247338ce59473ba4055a8daf1283c4d9d16c4a9736b8e1a2c999e9cd29c42"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
