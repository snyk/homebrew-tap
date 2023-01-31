class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1092.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1092.0/snyk-macos"
    sha256 "962ae99e1884cc09beaec7fa11cd644444094dc09c4b69d31df777edd48b0188"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1092.0/snyk-linux"
    sha256 "6a5dcc765692154baedaa8389d632193586f5af53bffc03a64e40cef696a26b3"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
