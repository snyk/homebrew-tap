class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.750.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.750.0/snyk-macos"
    sha256 "aa7f79d55a0310fe99d61d055c98227a5efa67bc3e62d680c14c40aa3e1a6fcc"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.750.0/snyk-linux"
    sha256 "0f8e29301ae7a5cb1243e4ac2973ded392f7ce64063d3e65acedbb29700c7e88"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
