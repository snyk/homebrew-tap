class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1272.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1272.0/snyk-macos"
    sha256 "f7ef7135e02d308fb9bc1155dd948efc319dec0e34437e93b4347a7519dd5bee"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1272.0/snyk-macos-arm64"
    sha256 "8383003738f4ea0780c5120b51b2c9b0f2afa5b1b9ef8d29d9f4483c0d5187ec"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1272.0/snyk-linux"
    sha256 "3d1f847b152353738421aa52cffccf1055dadd2f2ed9f04919875f898fdb6cab"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1272.0/snyk-linux-arm64"
    sha256 "685aa6e15fb0cf6c36532940f587e8cbc810c0591641dadeb1785db64a734a2b"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
