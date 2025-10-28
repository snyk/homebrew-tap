class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1300.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1300.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "a6a91aaac057ffc7c9ecaf20dc15cad47046ed5ca1e1c4728be38a3913fc8a27"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1300.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "124ddd06ea261e3cf0009cc642c613f4f23c694baadda361428a2454ba64412d"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1300.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "b9b8de3b37a03fd4622f66f63a40521f2e17ec1ea0794fa20ef8ed1a87e6db26"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1300.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "5f44e2b0f904ce11c3bdb20cff9ae4a7ea98c8dd417d7a10b8f872b58ef232d0"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
