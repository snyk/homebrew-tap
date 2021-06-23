class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.641.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.641.0/snyk-macos"
    sha256 "763102272e2dc818870848b8b0d8da80827b42b4ca20ce5381b999b030346d47"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.641.0/snyk-linux"
    sha256 "83149b4601338a247f5b1990eea7b5b2ba2869670f0fe793f1da5d13d244cbb0"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
