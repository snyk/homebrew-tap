class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1271.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1271.0/snyk-macos"
    sha256 "df80abd036828ba04354583ca7bf521eb0bea17b8b80f9b65fbbe36348a61ae6"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1271.0/snyk-macos-arm64"
    sha256 "8109898cd628c5e6cd7c75523ed70a16527ab259ee1501283f80e246c61119bb"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1271.0/snyk-linux"
    sha256 "419c3788eb373ebe2224fc972b89630e759aa774312f4b4d09e9933ab154aeae"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1271.0/snyk-linux-arm64"
    sha256 "c48538df9048a3576a3536e37d9e34ce75aeada25a806cfe59444df4ceebd6c1"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
