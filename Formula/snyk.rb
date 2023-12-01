class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1259.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1259.0/snyk-macos"
    sha256 "345bcbe490d4fd389b84338b2c4cebafe4498946bbf1237848b89cde0d241869"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1259.0/snyk-macos-arm64"
    sha256 "c6439558585af593ec4a17bd390edeaf30758ca9e711e3fe080c7ed054997d73"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1259.0/snyk-linux"
    sha256 "881e6f29fc713eefad1693304128be6112973117d877d35065647384dc95de52"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1259.0/snyk-linux-arm64"
    sha256 "fd86e2696314db845e89f7709aaa2eabf4807486c120dd608dfc966db9f0db50"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
