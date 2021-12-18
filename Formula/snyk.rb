class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.797.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.797.0/snyk-macos"
    sha256 "c3497d9bfb8b183d9192a2042fcff8a246fac80676d4eb503ca115bb87410ea4"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.797.0/snyk-linux"
    sha256 "3a5a41abc20c801304fd56bf7b826c269441b3f5f3a005b099d69f638f493445"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
