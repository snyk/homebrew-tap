class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1252.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1252.0/snyk-macos"
    sha256 "23ad66af7aafefc09f0189829249b053dc4938c982c984eec57f1a29e869b45c"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1252.0/snyk-macos-arm64"
    sha256 "06f389469357cf872b10bdd649539ca15f95c5d2fb008797caf28f69b2a30c99"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1252.0/snyk-linux"
    sha256 "4d274f1df63c5d6457948c7d2c2fb1276ed3df5133404039e0ff58cd15b56754"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1252.0/snyk-linux-arm64"
    sha256 "9e946745f6c4ad09e622e6f212670bc8876643cab53265f4cbc26fb296b0d65b"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
