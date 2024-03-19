class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1285.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1285.0/snyk-macos"
    sha256 "39ed47bdba9f616e65a54b59c81f34750bb7d10f46e47508307b0152c8fefc94"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1285.0/snyk-macos-arm64"
    sha256 "7f139b348d771e98d8e5d14f68ae1556a39f244b605c4a536018561d127ecd5f"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1285.0/snyk-linux"
    sha256 "942ae0917ca6316c50a4cc10913f7a98356a3071a8ead4b4fcc4a917e5b4786a"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1285.0/snyk-linux-arm64"
    sha256 "41bf3d8a10f0aec8cfa8ef1f7d11a3196c90bb4c3b31c7e2e42d1e6ee7ea7c7e"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
