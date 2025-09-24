class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1299.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1299.1/snyk-macos?utm_source=HOMEBREW"
    sha256 "f204987cd0e59bdceeca24d448aebd73ff939edc7d9e0f04a39c19d7c4547c49"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1299.1/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "2fdb5658331d7176ac994336756c96545cb67758ce3ba83ae774a8e6922c28df"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1299.1/snyk-linux?utm_source=HOMEBREW"
    sha256 "98a6fcb3dabf160974ee2fb8a4182b297761e359c34745a67673406889adbaef"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1299.1/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "80b947d9fcf493acdca8f92d3b6d6742698e5984a6adee0693c05a26d1bde76f"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
