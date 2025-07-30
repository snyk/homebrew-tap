class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1298.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1298.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "bbf31a108032459d6f4ede1359d0790f426b3880b9400fae9a4eca220a8835da"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1298.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "0a5016d8ec007483fc3397ea06c4f655a3771c3bee34fb778b8bb12c5b19ed9a"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1298.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "83a661b4d69dd7e64fa198c1f5a3093f189666dd3a298c40f8f3e4d917404d7a"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1298.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "b9aa533cfa4477eec032578390e6978647f919d8ca03029729235fc58a88d29d"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
