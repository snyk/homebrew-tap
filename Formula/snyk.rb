class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1256.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1256.0/snyk-macos"
    sha256 "ff331d6b27986572840f42eaf8bbd3d9fbeba59181f02ac3725aefb5435b8fab"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1256.0/snyk-macos-arm64"
    sha256 "346a52114f682f176536740e9e972758e2bfd678c7e8da30bb99058e19afb276"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1256.0/snyk-linux"
    sha256 "aea12f014c89b171d0230da472b6c46557ffc3cc3c06abd1a354cdfc87dedb79"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1256.0/snyk-linux-arm64"
    sha256 "58876031aa6344d6405d84a6a1f47b4afa11e3cc32804e698cd43a5a89f8ab43"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
