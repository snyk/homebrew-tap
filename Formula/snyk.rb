class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1232.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1232.0/snyk-macos"
    sha256 "d5e7bb79d6a7db0d109b461bdd5fac97b02bc712947c8baf6e98b4fa117e9d8f"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1232.0/snyk-macos-arm64"
    sha256 "0f07980bc3be2f135ba4f7996f217c17c9bcf3f4874076b6506b169c8f6305b6"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1232.0/snyk-linux"
    sha256 "8992e42a90a9a9e86eb67ce8b1e4fa29b2e800a1c66de3e7f0dc35b9ab72f140"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1232.0/snyk-linux-arm64"
    sha256 "4de8192c237a8ff559feb9ef1e907e0fbc3444c78a85001c96d01da5f6de588a"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
