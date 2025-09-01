class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1299.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1299.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "99d5ea930dfdc913c54c9a6ff4ca743abdc39586842ba7f8836532d571b966a5"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1299.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "ca801a6bc1bf32f9983d0f2afcc538c621e4330226627bf4e95135a940502a25"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1299.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "62764313ba69b109455371aafd7224c812e6ce98d5160da442c063b4d2676501"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1299.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "575ad3a55166e0a2593e1b8d78ddede589aaa0197127125716053ba2169b47ab"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
