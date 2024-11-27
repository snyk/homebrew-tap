class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1294.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1294.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "62227bc4a9b4fb3fe047fa788a2b3b37f4c8138cf77f4ac0ad0989134178120c"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1294.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "750a4ba317d0efcb193e6ab3f4e7c8286a2c21ed025de64890e72354018c943f"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1294.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "c913279efd0ee37c84fad43c239bd13494ab891db7e12e2dc984ff4309743cef"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1294.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "28c6b1f9a87a9a9c120ba79b6a39c72c95afbdab72d75fac520d9d0efedab963"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
