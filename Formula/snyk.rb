class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1307.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.0/snyk-macos?utm_source=HOMEBREW"
    sha256 "2c1967981428f5a70f7f6b7a166e7c4821aeb20548517e99810ec4b299d71980"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.0/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "6b1d352079346b3cc338b0cf0e1c967041dc42da0d78ebeed087eb8078039a3f"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.0/snyk-linux?utm_source=HOMEBREW"
    sha256 "65fc01c378bd71f08cff214f7f8f91be907a27aa18b9649296cd8606adce245e"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.0/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "3cefc616f8bbdad152b4c2ef73572c55dd425504afcc3ffa54efe20071b2b8d0"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
