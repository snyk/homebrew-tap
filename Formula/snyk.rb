class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.618.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.618.0/snyk-macos"
    sha256 "c506c21061fca842b2f2810e24c9225ca89c75eb09d5ffbbbdd1005d20599a4a"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.618.0/snyk-linux"
    sha256 "eec5a952f05fa024b851fd6c6fd96bbb2d32cdd0fd6aa1b1a66da7f4f82c5638"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
