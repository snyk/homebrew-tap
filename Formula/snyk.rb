class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.505.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.505.0/snyk-macos"
    sha256 "26b4f3e12349dbc5cb8618ba6ac92981fc770aefa3626071d70f15a52149a3aa"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.505.0/snyk-linux"
    sha256 "fa0356e3ec9bb4bd67c2111a22ad2edd3aa11eaed2f4eb2a02b1d1a9f8d05c57"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
