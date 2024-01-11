class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1269.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1269.0/snyk-macos"
    sha256 "17f78b527f2f83e0f1b8502227ad5c2f44fedb90ec1a3a40299d36560ba36603"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1269.0/snyk-macos-arm64"
    sha256 "3a15305f5d193db6f98028fe5b03270896fea60f41918824f897a1e071568acf"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1269.0/snyk-linux"
    sha256 "c8809acbedd782f19fb7c590dcb207ce424967ed852eac4d19a404ab3d945bdf"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1269.0/snyk-linux-arm64"
    sha256 "2c45e794c4e9bf93cfbf247008148f1214bcfa7c0ef49b8493b8c520c1c7fc3a"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
