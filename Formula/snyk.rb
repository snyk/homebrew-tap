class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.424.0"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.424.0/snyk-macos"
    sha256 "c67e6c795d3571213a292750c2e1e2084926955e1cbbbaf202e4eb860c86cbc8"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.424.0/snyk-linux"
    sha256 "27770f8bb902eda12716c71c63a49b44c6fc51865b4ecbb9211cba8efa49df73"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
