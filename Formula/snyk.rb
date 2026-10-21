class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1308.2"

  if OS.mac? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.2/snyk-macos?utm_source=HOMEBREW"
    sha256 "00c3365467eb474f4a74b531acca31972463e67979a9f972d0bcee65fa23d45d"
    def install
      bin.install ("snyk-macos") => "snyk"
    end
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.2/snyk-macos-arm64?utm_source=HOMEBREW"
    sha256 "14cf5b6a56fd2616836369d32873d7d1fada788c0a345ddea316a9327d0bfe24"
    def install
      bin.install ("snyk-macos-arm64") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://downloads.snyk.io/cli/v1.1308.2/snyk-linux?utm_source=HOMEBREW"
    sha256 "eafe77550e44b9905fdf6c3ab1f583059274ba0c74284c7e03749d793fe66e73"
    def install
      bin.install ("snyk-linux") => "snyk"
    end
  elsif OS.linux? && Hardware::CPU.arm?
    url "https://downloads.snyk.io/cli/v1.1308.2/snyk-linux-arm64?utm_source=HOMEBREW"
    sha256 "9660b10fea28245629c6d635e13f353973efa471b24865b38889777fbb7832b9"
    def install
      bin.install ("snyk-linux-arm64") => "snyk"
    end
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
