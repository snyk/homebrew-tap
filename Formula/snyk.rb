class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1306.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.3/snyk-macos?utm_source=HOMEBREW"
    sha256 "b6fed621d28f16b712a8ea3c7121a3ecfab1ca806af41f08f86987c9c9f9b81f"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.3/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "6affd215ef52f0eebaddd34e946c64bc8cfb06223387d8e6164a10501910fa92"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1306.3/snyk-linux?utm_source=HOMEBREW"
    sha256 "a76435dab2cecf567d2be13c5dd5dc5db1bc5959adf0f185e5f9419574ceb6fa"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1306.3/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "a31bb3b69ac88b1f1a7795e9a1800d834c3e843eede06a347d5cd13c955efe02"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
