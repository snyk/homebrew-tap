class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1308.4"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.4/snyk-macos?utm_source=HOMEBREW"
    sha256 "a5dd98a899b2843d4add974682ccb2cc2420d758edb2ac98ff17dde547ae5412"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.4/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "dfb90210c5fb7d22e163b6518ed35c3634f6e5903932ef51096c3d768cac8f74"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.4/snyk-linux?utm_source=HOMEBREW"
    sha256 "979172ee128903f50e43fff221f22a0689579f22c086dabaa0d1a5416485b9ba"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.4/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "9cf3e55e4bd216138a86a08f6d4235d5a014459cf0df7150818421fd8e044d48"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
