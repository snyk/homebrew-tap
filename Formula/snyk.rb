class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1162.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1162.0/snyk-macos"
    sha256 "8aea5f643bae3fdc6e0055180a15ac6fca85bb83777e37d9a3dca5b0b19309cc"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1162.0/snyk-linux"
    sha256 "fb46459b7e8cd27084f0ea3751f079eaf6fa55ef92d7aeacf034f94751ee3427"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
