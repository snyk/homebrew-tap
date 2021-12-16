class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.793.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.793.0/snyk-macos"
    sha256 "4fadba50288eb29876a11a9e815fbb61b08597cc9ee6f2a5480461ec0c3b13d5"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.793.0/snyk-linux"
    sha256 "cb5d5cb33683e95e9c114766f7c02abeef3be4b178f7779bdec4eabe0406d95c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
