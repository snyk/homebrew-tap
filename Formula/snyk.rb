class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.935.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.935.0/snyk-macos"
    sha256 "17366e6bb6db42400f3ec07145742d9acaf15928d3a2f405ca1707da49b48925"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.935.0/snyk-linux"
    sha256 "c608e29c8273e3a02d5e5ed74d5147e2ba31f315d5d729c758f62c24b2d04c78"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
