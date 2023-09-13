class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1217.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1217.0/snyk-macos"
    sha256 "e09afc37b4156d84bc18ae5aec5d4c01c41ad2d329d2a3619a764a1e098b476d"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1217.0/snyk-linux"
    sha256 "d644276e18a5fcc90fb3b8bdbf85c201cf4358da953fe1124bc7a107cd153a2c"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
