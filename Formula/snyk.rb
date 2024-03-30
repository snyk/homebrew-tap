class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1286.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1286.2/snyk-macos"
    sha256 "a335d6b974e5ae0cb9213f3abc9d9a61d34a2b618f58928f30973af3553f23b7"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1286.2/snyk-macos-arm64"
    sha256 "1bc40afe86e0e43feafe1ccfe2a7bf3dd3ec73a5adc7b0d98590be9610a5bf9c"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1286.2/snyk-linux"
    sha256 "4d326e297c4b26321b90580df509619e7ce1178ae6893c9692795314849d59eb"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1286.2/snyk-linux-arm64"
    sha256 "bc9413c6993e0a46ce8fb29139f07291a9c038e3fa31471be7ccf0be32ca1e59"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
