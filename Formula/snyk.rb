class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1284.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1284.0/snyk-macos"
    sha256 "04541c643ca05659e8eb6babd76b5092c6d003d5887a4919290ba095f5c58756"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1284.0/snyk-macos-arm64"
    sha256 "51d506741df7b9b7d03022a5649520336796076a83b0ee8ca3f821b9c5d2145c"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1284.0/snyk-linux"
    sha256 "67e6c1b93a4b02759b266f2a84774aae4f5592107a1a0c4e00166020ac09fa32"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1284.0/snyk-linux-arm64"
    sha256 "bd11f70acbba4357a8f5617eb6db182f4b89fddbf4e61cd9b73a9f702c01257b"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
