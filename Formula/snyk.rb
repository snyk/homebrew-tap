class Snyk < Formula
  desc "Find & fix known vulnerabilities in open-source dependencies"
  homepage "https://github.com/snyk/snyk"
  version "1.1052.0"

  if OS.mac?
    url "https://static.snyk.io/cli/v1.1052.0/snyk-macos"
    sha256 "d2b42668d0c73cd737f211a6c205bcf30e35e4c6e9a1bf4f324cefed98adf95b"
  elsif OS.linux?
    url "https://static.snyk.io/cli/v1.1052.0/snyk-linux"
    sha256 "9034955119aff10a2040e2b1cc5c2c7fe68755f07e048215f12f68bf9d57db43"
  end

  def install
    bin.install (OS.linux? ? "snyk-linux" : "snyk-macos") => "snyk"
  end

  test do
    assert_match("Authentication failed.", shell_output("#{bin}/snyk auth homebrew-test", 2))
  end
end
