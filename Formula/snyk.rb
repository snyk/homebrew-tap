class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1281.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1281.0/snyk-macos"
    sha256 "06bc6f66a9f09b75b689abc7f1bed4e364ea86e0c334403fd11e41fff7bfa0d6"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1281.0/snyk-macos-arm64"
    sha256 "2411aea7e7acda6fdf8df37f393c6ccd7ec42cb777b7cb533062b8f4165e6cf2"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1281.0/snyk-linux"
    sha256 "751950defc80c7c6d3cecdca790d0d252bb206469460bd621b8827c3de2f6bfe"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1281.0/snyk-linux-arm64"
    sha256 "85e4032d07644f1788df0616cbeb46e25ed3b3dbcbf9e9cb6a91a019961c9204"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
