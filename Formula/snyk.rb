class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1125.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1125.0/snyk-macos"
    sha256 "8a3fd4af006baf7441ee9b91564d79d63b1f7d0fa4de13426d62c911ca21973b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1125.0/snyk-linux"
    sha256 "ba77ec97b630122e9b8fa4b1f2f88641b87ba1adcbdc8312a6697296930cbe7c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
