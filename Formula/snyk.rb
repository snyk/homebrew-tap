class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1298.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1298.3/snyk-macos?utm_source=HOMEBREW"
    sha256 "c9d26776ee4122e94c5f15a4eb8b818e19f6c9eec8d9bea4f5650e71275ff5c7"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1298.3/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "db50a50cf8e1a64872de90ae3a0133ea7d151e3f08950c61415b943b822d9573"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1298.3/snyk-linux?utm_source=HOMEBREW"
    sha256 "943cffd46891174b0f660a8d20d9e555910a178ca2f74dff98844b38388e49dd"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1298.3/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "efae6da3d1ada3dfc505809e6a59d3800b32359d62ca607669d5516d5440294b"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
