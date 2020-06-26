class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.349.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.349.0/snyk-macos"
    sha256 "d90c2c5189ebcd4acf928f4c272d0a8850e2c5f486812aca44b743c786e07386"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.349.0/snyk-linux"
    sha256 "e2ef3fb0a37c08f28f012459d8f64b215bf9fb1b3c5735fc00783ce2ffb2fd06"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
