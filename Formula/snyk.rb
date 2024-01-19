class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1270.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1270.0/snyk-macos"
    sha256 "c8b725bedf7deda57cf5d56312e92decf60ea5b78c0e0a4a6c506855b024a8db"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1270.0/snyk-macos-arm64"
    sha256 "905c73ea7c5b2449009656dfd683dfa2b53f69e2f00c7e2577365bda24a07991"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1270.0/snyk-linux"
    sha256 "0a24b9f2846c9a3deb2dc4b0ae9e3d64c5f9349b3045c36a1361ccca6a339542"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1270.0/snyk-linux-arm64"
    sha256 "5dbb1e6ba311a67c012b120eae7f517fdd317923fbe50bf0e0874e701245038a"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
