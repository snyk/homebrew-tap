class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1292.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1292.1/snyk-macos"
    sha256 "0f4435863a5d0af97a1fc668d00fe616900c0fc7672e33cb657f772bf0d3510b"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1292.1/snyk-macos-arm64"
    sha256 "699f75ff0a64913ec84f27755541e7e6f43a4d8f26b1269a2749cf8a78519bf6"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1292.1/snyk-linux"
    sha256 "991a415727c130c4f2a562b483b02a18e4377c0fd87b761a7e1efc90f0339a9c"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1292.1/snyk-linux-arm64"
    sha256 "e017d3876ee3bce32068c788508acf78824b79f720902eafa0c8de5a1cae9936"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
