class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1064.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1064.0/snyk-macos"
    sha256 "57bf4be9be370252b1cdd941b783c80973bbdeac267668685bdc17b9ac1d5974"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1064.0/snyk-linux"
    sha256 "80c408392fd8ca28d6d16d82304507b0347c768672f4d6229ea6846b427a12c1"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
