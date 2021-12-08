class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.786.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.786.0/snyk-macos"
    sha256 "e03ff3e0453acf40b2b9c4cc30a3588c44ab6b3bf1b18469e79e9523d125a7a2"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.786.0/snyk-linux"
    sha256 "7de1d7057ee620a37ddf36e4d1628fd72baca24fe4d638dedee5cfc5e316bb0c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
