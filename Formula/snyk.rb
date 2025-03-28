class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1296.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1296.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "b3dca27354b43bbf6af0c6822ffc6b23d9dbc7efe9c593138188877169a2e99e"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1296.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "71a597df1b7e70efcef76e695a573794bc2d2ac963acf7d2b419f5ac7b14ee1d"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1296.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "8870d953730cf1ff0bf248d5daab10d605f341864417b6a2026432acfff8504d"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1296.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "22292b00d4460d3a2dd5a009832352db22c5efdc3e26fad47f39c464c4bfc163"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
