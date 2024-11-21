class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1294.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1294.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "6f768d7050bc872164ecbfc35d6c32a19be2f353789e2c280fec98e21a41b58b"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1294.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "1de2a6cc07c60cc25e5767d01166a655ba2f512e7a0887cf59f0ee5930b33746"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1294.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "56f443cd8770527ff1e5f3f02593bc0b0181baf50bdf4b2dae12ca02684acefe"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1294.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "cc737c5630cc43dccf8bde598205a4d10e4d6e9a6c7251ab931ec1b490e866db"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
