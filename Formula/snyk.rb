class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1309.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1309.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "886740e8b33e821f46e90ed6510ce09c1aa431f3ff2b16418eb42c4dcb6fe596"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1309.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "54e7c341d6ab37da4c0a728bcde1064f78faf898f498acb4a214d397ec50ecc0"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1309.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "4802579c2818938a2f4849d270df1139f310104286a8a5c6305328a3c2eb9e1c"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1309.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "97d6c5d0aed21d0f8ae0b0b7764acab3c67f5ccd211b1069a6a74fd953e5c600"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
