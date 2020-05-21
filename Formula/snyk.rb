class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.323.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.323.1/snyk-macos"
    sha256 "0ca04c5b60e6816d2d5a62ae8f1d1b6b853cc7ab29eb43683d89942c335445ce"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.323.1/snyk-linux"
    sha256 "c75e3bd1970e0ed4c30053784ae42083d177dd0373fc005ab89efe52cb39efa6"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
