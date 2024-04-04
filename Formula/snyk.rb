class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1286.3"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1286.3/snyk-macos"
    sha256 "ea6c220f876d47e3e8395d76bf73607cd74c82fda7786fb9f944fbf1fd14b09d"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1286.3/snyk-macos-arm64"
    sha256 "01c97c297d192cb03f7556dd23ae694ffdf1691182ebe5691cd647701cbb3365"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1286.3/snyk-linux"
    sha256 "ff838e01ac7405c391b8bfa31fd084ab61b89ec73d2e0d0a44d5e21b50449230"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1286.3/snyk-linux-arm64"
    sha256 "2e2b881b388665f5d0c17dc0049d93e86538a144dbf8733c3ae395d7995611da"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
