class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1231.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1231.0/snyk-macos"
    sha256 "378b8ae818229e73609cf621587c4223259595531c6b6f9c6d45a29468ef4910"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1231.0/snyk-macos-arm64"
    sha256 "0db6c23eaa975e1a73019f2e11c714aba386e043423cdb22ad41e4e6d51d9c07"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1231.0/snyk-linux"
    sha256 "0964f4fa4f3b5558484a8c2d726d9f7071f26a1a158fc88440828c860fe3c0c7"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1231.0/snyk-linux-arm64"
    sha256 "8b34e20cd3f038d5c355581cc660c4557c6c84508c20b856c877374af2ba5c12"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
