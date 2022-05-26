class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.939.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.939.0/snyk-macos"
    sha256 "a3aa4cc520fc0823cf96d3ec3a6ceae34c3931b8c6b0f960a028fd5d6128f80e"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.939.0/snyk-linux"
    sha256 "f8ee6ec04d6ad68a391a37c759c6bf583f1965f1ecf1b110c059ef886e964772"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
