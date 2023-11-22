class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1251.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1251.0/snyk-macos"
    sha256 "26ee4103106c77bccaefefa10f1889b1bfcc1b0a7d63bcd350ccc97d0f93a3a7"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1251.0/snyk-macos-arm64"
    sha256 "aa4b238117710aae11efcdc0248fd8468b1f546d983825e9141e418fb66a8a66"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://static.snyk.io/cli/v1.1251.0/snyk-linux"
    sha256 "01ca841754a62a2531c0058066b25bb61fbd05bbf8ae3211370c6cfb3e05b4c5"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://static.snyk.io/cli/v1.1251.0/snyk-linux-arm64"
    sha256 "f8410406744189631c2529bd427261c152b6d376c12a95b0b293b2a64d3b785c"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
