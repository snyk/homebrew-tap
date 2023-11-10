class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1243.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1243.0/snyk-macos"
    sha256 "adc2e80ecb1aab656cacb8c108d955bfe6a47624d7b70b72f1e0010f4ea3259f"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1243.0/snyk-macos-arm64"
    sha256 "f7c2e9d97a2c4e3752c7823f21cee1c32a568a5abccad0b1c748369bf4715c8a"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1243.0/snyk-linux"
    sha256 "f6c158b2ee2001bdf0763bf88c60149d198528e83d5175d48cbcc9635df066c6"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1243.0/snyk-linux-arm64"
    sha256 "03939106fb4ad8f46008e821143be5d4391d00dcc51a08c1b3b8d31c302fbc7e"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
