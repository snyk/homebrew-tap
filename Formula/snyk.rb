class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1283.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1283.1/snyk-macos"
    sha256 "6f5ba0d8e25f059312eae35801020c11c0283cd53d8a2f2cdd41e9ff9fdd4b8d"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1283.1/snyk-macos-arm64"
    sha256 "6d3f1d70901fb5cd18acbdd8ab8ebba444f3e5ba044d91bd99a411fc96562c8c"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1283.1/snyk-linux"
    sha256 "4a1cb5cab41f5c913dbfe9796954c7eb7a92c9f44ca73d3851967609b8d6f846"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1283.1/snyk-linux-arm64"
    sha256 "ce3b4b4f2bdebd1d85a2bad5101a3aad415c7f83184afe24f107f921cc8edf29"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
