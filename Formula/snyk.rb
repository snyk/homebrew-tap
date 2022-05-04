class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.917.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.917.0/snyk-macos"
    sha256 "179aea915a0ebd0a1aca721998cb3bb8cbdd25ca1623e924162eb1f6b5f1990d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.917.0/snyk-linux"
    sha256 "e8df6cec5b23eb2aa2a22155f15e2bd355a46f70667190635a2d5c7b37c85e0d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
