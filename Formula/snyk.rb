class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1264.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1264.0/snyk-macos"
    sha256 "e1d4e737c2f21c6681805b43101598d02239c27c9c056c1c45f11efb4f0b1edc"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1264.0/snyk-macos-arm64"
    sha256 "c8cd0cf37ae7299efa572cac92c547bb2295b81edc874f50b1323c11c9bad3d1"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1264.0/snyk-linux"
    sha256 "0e313ed0f5ad870eb93a90f3c274715c1d39a1c95f8010e90a385cbec056fca0"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1264.0/snyk-linux-arm64"
    sha256 "17798db87bf1a01b6e4216c98669239ea49058b97b3663276a9055677af1d55b"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
