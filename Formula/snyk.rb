class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1034.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1034.0/snyk-macos"
    sha256 "707da23f4699caf2d85c9331a52c07a0748e8ccbe354d1a0e64a8492805d5063"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1034.0/snyk-linux"
    sha256 "4859a9c1d0a8675cc0de08c97f698aa4da4ea0412e6c21b7827d456899789c6d"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
