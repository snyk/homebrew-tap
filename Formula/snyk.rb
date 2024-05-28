class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1291.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1291.1/snyk-macos"
    sha256 "6d180635ef9c826f70be4f4c055a1fa508cadf4dd484e3867d7e374b9d139b12"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1291.1/snyk-macos-arm64"
    sha256 "2acb24ead65681545d68e70997be0e805432cf3b1828ac611145ff71c7e8c074"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1291.1/snyk-linux"
    sha256 "89eab1658f1c73ef10d7ce77a3fa7370669056c947a1b96631e158ebd6269c4c"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1291.1/snyk-linux-arm64"
    sha256 "c4b91a5e79ad5bd78977d1170221614145298154897f3987af6a0dba4e325a4c"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
