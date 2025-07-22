class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1298.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1298.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "5dd378b7c6142995f7e48e361188fd01fc844c39dbe72dc724e589e3d5500d56"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1298.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "ec20a0b65e68d58361a9e265b3efbe78a7de1d7098138c01fde916edb0ffa007"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1298.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "9fef71f4c12094b5682996f1970f1184d4b048b1faa20f67094ab1407b3d8afc"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1298.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "8ae09e5e10ea9a942033c83b83b2002eea249f31327119b554a80e352c30fbbc"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
