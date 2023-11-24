class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1253.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1253.0/snyk-macos"
    sha256 "4a90b36e2b7422f368a5ad55591c3291d01a02994bdcdccdd0572c19be54b8d4"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1253.0/snyk-macos-arm64"
    sha256 "14e216f9ffb506654a59b14d85456492ece965d7d15c73c3ef82f926290bdb8b"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1253.0/snyk-linux"
    sha256 "4bd6314c9562cd9cc46822da8004f89ac1b14b682bd3b33a980561891d15fd5f"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1253.0/snyk-linux-arm64"
    sha256 "f1da3d6492d53b26155a521de0bdfeea5f057e545df90b956ec0ffbf5d599f86"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
