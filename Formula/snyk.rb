class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1303.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1303.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "400b503403e59faff8b46f95e9d94f6abba8c58c4c2b9f5437e5804a9373e533"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1303.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "66f0e34a8e10d1314de63e37c08f7c13f19f5e5f41a466d9ae89be635859a955"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1303.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "ec9708245d1bb8ccae43ffd7d5f11e8484f8155a90d531ce4f5bdca510dbdbe1"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1303.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "bf0edd061251de8866b4792e052a38cbd06a3429e3118738b4f7170e53bdf3ca"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
