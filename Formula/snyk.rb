class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "v1.425.1"

  if OS.mac?
    url "https://github.com/snyk/snyk/releases/download/v1.425.1/snyk-macos"
    sha256 "c360e346266070e1557a8c8630ed78565d90275ff8043ec9446b5e575c23e7c9"
  elsif OS.linux?
    url "https://github.com/snyk/snyk/releases/download/v1.425.1/snyk-linux"
    sha256 "3b1a6296f85726ccfa9c5e1d55c7f074f0e9949b7f26576982c901624404b5eb"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
