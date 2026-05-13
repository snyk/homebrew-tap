class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1304.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1304.3/snyk-macos?utm_source=HOMEBREW"
    sha256 "cff88665caa626005628cdcb45e43fe451b6fc5b328e2d278000d49c3295820e"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1304.3/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "a730df15969d9023685e424c93f6e0ec0c41b98cf1aa153268509bf519380435"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1304.3/snyk-linux?utm_source=HOMEBREW"
    sha256 "14c52172774884141b6ee97ba61b35eff731ec4b081f040cff23c3551b13b1e6"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1304.3/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "f37310c00131da118437b97fb07a7cdf4e15b356187f941271ea970844b7a650"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
