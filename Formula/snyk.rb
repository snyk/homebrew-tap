class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1307.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "06dd3b1116629f50745a922ee9487dbc7dff251bebfbef0d538ac9b7c0e034bd"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "afea33edbd274d41f2b0e094275f6814db778e173e10e0a5648232d6e6bb7a14"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1307.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "40453156449604129f6ed5cb98eb0c9aca27facd7dd8161d9c9828618b62e703"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1307.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "612f94d50e7373ce8304a5924531cd08f9b9df592015b3d70bbf58b0bd2e45cc"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
