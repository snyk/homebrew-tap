class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.373.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.373.0/snyk-macos"
    sha256 "4d24674ed85ac6eed20013945ec995e7810896394d05a7100b12686e90c42cf2"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.373.0/snyk-linux"
    sha256 "f2db42d03672b228c44c54b41f39bf3f129a075afbafd97f8d8f38b8b2c39c61"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
