class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1150.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1150.0/snyk-macos"
    sha256 "e696c6168734c3c3e681a10ac73754123ba2ae798b3d7b28266fd1d3d8797e5a"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1150.0/snyk-linux"
    sha256 "6a01f521874ebb850d7bb0d002aac29799ed7af3f6d7bc20c3b6635ca626952d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
