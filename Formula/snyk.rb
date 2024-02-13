class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1279.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1279.0/snyk-macos"
    sha256 "68109aa618c62c57c276af7e4325168b17b8cbb1ceb1d838718922238af4c14d"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1279.0/snyk-macos-arm64"
    sha256 "bb8ba50ffc8ce576eecc95a0315774eb6ecb9c39f59c21609f4d1532849131d2"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1279.0/snyk-linux"
    sha256 "35be50fba23ec3bcd1d19fdffdef9b0397a03e389ee9c9e2621b31fe5c26e73a"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1279.0/snyk-linux-arm64"
    sha256 "a6aee03e42bccaa5a2f06b863a640fa3bfc4cc9b70eb3c8a00d6a42c0fbf73a0"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
