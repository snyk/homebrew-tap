class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1261.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1261.0/snyk-macos"
    sha256 "c9c71f38f9fa7a58edef7f82e4f149fe4f0f2aaff78ac97d9a2076c027502ed4"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1261.0/snyk-macos-arm64"
    sha256 "31d5529a8223a0ec6f6116dc1c61ea93f41523a89090551fb3397a8c98108f60"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1261.0/snyk-linux"
    sha256 "7cc11ee8844fd338403fe808a05d37f6bc995e6f048529e2dbc88480f1a665db"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1261.0/snyk-linux-arm64"
    sha256 "2931372eef77c204faf4845d9706631beafb6b6331deef48ba591d79fd58afba"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
