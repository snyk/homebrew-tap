class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1308.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.3/snyk-macos?utm_source=HOMEBREW"
    sha256 "d5d8016f064db0e4b686ece9ffa041036d005bcbad2af27531ec5e391e9c64a5"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.3/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "b353a8b2d08fff5b385a55de123342c3d9a737e6d81c84e4cc0a62d6e2c1c3db"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.3/snyk-linux?utm_source=HOMEBREW"
    sha256 "5f323f45885341ea1473639859271925912ece82a2f77bc146bb4468f9838840"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.3/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "3686e7c29344dda49f9c86be6d48e9bc43f83b74b8c6f331dcc5d6d43f4a6faf"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
