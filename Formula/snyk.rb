class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1262.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1262.0/snyk-macos"
    sha256 "6b82cdfec1234eb61243f6da6a7d2099239fe0ff7ee0390806f9d1213a7363a6"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1262.0/snyk-macos-arm64"
    sha256 "0486d57f11e669ebae52829ea6c855ff2ac3d62f8aaa6900578cf341198934a2"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1262.0/snyk-linux"
    sha256 "cb0c8bf1c11e6571c33f920b6c3de3c81a5a8f276e18f3193587582b041a878a"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1262.0/snyk-linux-arm64"
    sha256 "da2a26733a642be28d211dc37dfb033e2f78920179042fc7d35ca22e5eca3f5b"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
