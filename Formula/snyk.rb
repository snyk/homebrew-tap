class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1287.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1287.0/snyk-macos"
    sha256 "d029bfa9eff273b5bcf7b7e6bc31bf6e33918d4f3d3a57fcfc1f7bf219e3cb39"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1287.0/snyk-macos-arm64"
    sha256 "fe70ba13cb7f82d8650ccfd847bdfe5a89c38d65268474597498a6d6256ebb87"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1287.0/snyk-linux"
    sha256 "fdf419e2cdce14d3c2b4a3706a59de9fe42411aec71cdc543921304a5a2214fe"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1287.0/snyk-linux-arm64"
    sha256 "b5258ce389bb41db6e8ac976520b97aeecd111fc4383f1087b17d15fb09a7bf4"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
