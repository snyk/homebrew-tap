class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1190.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1190.0/snyk-macos"
    sha256 "388764da9bf9db53ef283c1ac72e92d1328586d0b4bb64abd091b25c482089b2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1190.0/snyk-linux"
    sha256 "765e62eaed6244c7c0dde8220a3523d52e77402ddbb8f67bb3f8a4edb56ea02c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
