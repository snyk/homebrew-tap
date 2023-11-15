class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1245.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1245.0/snyk-macos"
    sha256 "f6bc8a344cdbf8eaf31e76106b13cd0a9fef23fec6e1916395b74e42cf0b49c8"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1245.0/snyk-macos-arm64"
    sha256 "17663358d174a11c21109a2678df5c6fbff574452ae6b36f39af832885b8a8cb"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1245.0/snyk-linux"
    sha256 "041a722e14c49bad4bfbafa76c62763f761c4ec48af6bea056ab776f87ca3dc8"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1245.0/snyk-linux-arm64"
    sha256 "71f59f8d21db03382ae9170bc64200055b0244f83fcb3361b1e44e5f80b4e71f"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
